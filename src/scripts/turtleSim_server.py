#! /usr/bin/env python
from __future__ import print_function
import rospy

import threading
from math import sqrt, pow
import smach_ros
import smach

import actionlib
from actionlib_tutorials.msg import MachineAction, FibonacciAction, FibonacciGoal
from smach import StateMachine, Concurrence
from smach_ros import ActionServerWrapper, ServiceState, SimpleActionState, MonitorState, IntrospectionServer
import std_srvs.srv
import turtlesim.srv
import turtlesim.msg
import turtle_actionlib.msg

def polygonial():


    # Construct static goals
    polygon_big = turtle_actionlib.msg.ShapeGoal(edges = 11, radius = 4.0)
    polygon_small = turtle_actionlib.msg.ShapeGoal(edges = 6, radius = 0.5)

    # Create a SMACH state machine
    sm0 = StateMachine(outcomes=['succeeded','aborted','preempted'])

    # Open the container
    with sm0:
        # Reset turtlesim
        StateMachine.add('RESET',
                ServiceState('reset', std_srvs.srv.Empty),
                {'succeeded':'SPAWN'})

        # Create a second turtle
        StateMachine.add('SPAWN',
                ServiceState('spawn', turtlesim.srv.Spawn,
                    request = turtlesim.srv.SpawnRequest(5.0,2.0,0.0,'turtle2')),
                {'succeeded':'PRECISE'})

        # fib_goal = FibonacciGoal(order=20)
        # fib_fullaction = SimpleActionState('fibonacci', FibonacciAction,
        #                   goal=fib_goal)
        #
        # StateMachine.add('FIBONACCI',
        #                   fib_fullaction,
        #                   transitions={'succeeded':'PRECISE'})

        goto_goal = FibonacciGoal(order=20)
        goto_fullaction = SimpleActionState('togoal', FibonacciAction,
                          goal=goto_goal)

        StateMachine.add('PRECISE',
                          goto_fullaction,
                          transitions={'succeeded':'TELEPORT1'})

        # Teleport turtle 1
        StateMachine.add('TELEPORT1',
                ServiceState('turtle1/teleport_absolute', turtlesim.srv.TeleportAbsolute,
                    request = turtlesim.srv.TeleportAbsoluteRequest(5.0,1.0,0.0)),
                {'succeeded':'DRAW_SHAPES'})
        print("hi")


        # Draw some polygons
        shapes_cc = Concurrence(
                outcomes=['succeeded','aborted','preempted'],
                default_outcome='aborted',
                outcome_map = {'succeeded':{'BIG':'succeeded','SMALL':'succeeded'}})
        StateMachine.add('DRAW_SHAPES',shapes_cc)
        with shapes_cc:
            # Draw a large polygon with the first turtle
            Concurrence.add('BIG',
                    SimpleActionState('turtle_shape1',turtle_actionlib.msg.ShapeAction,
                        goal = polygon_big))

            # Draw a small polygon with the second turtle
            small_shape_sm = StateMachine(outcomes=['succeeded','aborted','preempted'])
            Concurrence.add('SMALL',small_shape_sm)


            with small_shape_sm:
                # Teleport turtle 2
                StateMachine.add('TELEPORT2',
                        ServiceState('turtle2/teleport_absolute', turtlesim.srv.TeleportAbsolute,
                            request = turtlesim.srv.TeleportAbsoluteRequest(9.0,5.0,0.0)),
                        {'succeeded':'DRAW_WITH_MONITOR'})

                # Construct a concurrence for the shape action and the monitor
                draw_monitor_cc = Concurrence(
                        ['succeeded','aborted','preempted','interrupted'],
                        'aborted',
                        child_termination_cb = lambda so: True,
                        outcome_map = {
                            'succeeded':{'DRAW':'succeeded'},
                            'preempted':{'DRAW':'preempted','MONITOR':'preempted'},
                            'interrupted':{'MONITOR':'invalid'}})

                StateMachine.add('DRAW_WITH_MONITOR',
                        draw_monitor_cc,
                        {'interrupted':'WAIT_FOR_CLEAR'})

                with draw_monitor_cc:
                    Concurrence.add('DRAW',
                            SimpleActionState('togoal', FibonacciAction,
                                              goal=goto_goal))


                    def turtle_far_away(ud, msg):
                        """Returns True while turtle pose in msg is at least 1 unit away from (2,5)"""
                        if sqrt(pow(msg.x-9.0,2) + pow(msg.y-5.0,2)) > 2.0:
                            return True
                        return False

                    Concurrence.add('MONITOR',
                            MonitorState('/turtle1/pose',turtlesim.msg.Pose,
                                cond_cb = turtle_far_away))




                StateMachine.add('WAIT_FOR_CLEAR',
                        MonitorState('/turtle1/pose',turtlesim.msg.Pose,
                            cond_cb = lambda ud,msg: not turtle_far_away(ud,msg)),
                        {'valid':'WAIT_FOR_CLEAR','invalid':'TELEPORT2'})



    # Attach a SMACH introspection server
    sis = IntrospectionServer('smach_usecase_01', sm0, '/USE_CASE')
    sis.start()

    # Set preempt handler
    smach_ros.set_preempt_handler(sm0)

    # Execute SMACH tree in a separate thread so that we can ctrl-c the script
    smach_thread = threading.Thread(target = sm0.execute)
    smach_thread.start()



if __name__ == '__main__':
    rospy.init_node('smach_usecase_step_06')
    t1 = threading.Thread(target=polygonial)
    t1.start()
    rospy.spin()
