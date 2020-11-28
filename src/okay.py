#! /usr/bin/env python
from __future__ import print_function
import rospy

import threading
from math import sqrt, pow
import smach_ros
import smach

import actionlib
from actionlib_tutorials.msg import MachineAction, FibonacciAction, FibonacciGoal
import actionlib_tutorials.srv
from geometry_msgs.msg import Point
from std_msgs.msg import String
from smach import StateMachine, Concurrence
from smach_ros import ActionServerWrapper, ServiceState, SimpleActionState, MonitorState, IntrospectionServer
import std_srvs.srv
import turtlesim.srv
import turtlesim.msg
import turtle_actionlib.msg

def polygonial():

    print("di")
    # Construct static goals
    polygon_big = turtle_actionlib.msg.ShapeGoal(edges = 11, radius = 4.0)
    polygon_small = turtle_actionlib.msg.ShapeGoal(edges = 6, radius = 0.5)

    # Create a SMACH state machine
    sm0 = StateMachine(outcomes=['succeeded','aborted','preempted'])

    # Open the container
    with sm0:
        # Reset turtlesim
        #StateMachine.add('RESET',
        #        ServiceState('reset', std_srvs.srv.Empty),
        #        {'succeeded':'SPAWN'})

        # Create a second turtle
        StateMachine.add('SPAWN',
                ServiceState('spawn', turtlesim.srv.Spawn,
                    request = turtlesim.srv.SpawnRequest(5.0,2.0,0.0,'turtle2')),
                {'succeeded':'PREEMPTABLE_MOVE'})

        draw_monitor_cc = Concurrence(
                ['succeeded','aborted','preempted'],
                'aborted',
                #child_termination_cb = lambda so: True,
                outcome_map = {
                    'succeeded':{'WAIT_FOR_CLEAR':'preempted'}, 
	            'preempted':{'WAYPOINT3':'aborted'}})
                    #'preempted':{'WAYPOINT2':'preempted','WAIT_FOR_CLEAR':'preempted'},
                    #'interrupted':{'WAIT_FOR_CLEAR':'invalid'}}
                    

        StateMachine.add('PREEMPTABLE_MOVE',
                draw_monitor_cc,
                {'succeeded':'TELEPORT1'})


        with draw_monitor_cc:


            pos1 = Point()

            pos1.x = 0.7
            pos1.y = 0
            pos1.z = 0.5

            goto_goal = FibonacciGoal(order=20)
            goto_fullaction = SimpleActionState('togoal', FibonacciAction,
                            goal=goto_goal)

            Concurrence.add('WAYPOINT3',
                    goto_fullaction)

            def turtle_far_away(ud, msg):
                """Returns True if UNITY STRING is a kill!!!"""
                print (msg.data)
                if msg.data == "home":
                    return 'valid'
                #if msg.data == "kill":
                #    return 'invalid'
                else:
                    return 'invalid'

            Concurrence.add('WAIT_FOR_CLEAR',
                MonitorState('/cf2/pattern', String,
                    cond_cb = lambda ud,msg: turtle_far_away(ud,msg)),
                {True:'preempted', False:'succeeded'})

            #Concurrence.add('WAIT_FOR_CLEAR',
            #    MonitorState('/cf2/pattern', String,
            #        cond_cb = turtle_far_away),
            #    {'valid':'preempted','invalid':'succeeded'})

        #pos2 = Point()

        #pos2.x = 0
        #pos2.y = 0
        #pos2.z = 0.5

        #goto_goal = MoveToGoal(point=pos2)
        #goto_fullaction = SimpleActionState('detect_perimeter', MoveToAction,
        #                  goal=goto_goal)


        #StateMachine.add('WAYPOINT3',
        #                  goto_fullaction)

         # Teleport turtle 1
        StateMachine.add('TELEPORT1',
                ServiceState('turtle1/teleport_absolute', turtlesim.srv.TeleportAbsolute,
                    request = turtlesim.srv.TeleportAbsoluteRequest(5.0,1.0,0.0)),
                {'succeeded':'TELEPORT1'})



        # # Do a lil traj.
        # goto_goal = doTrajGoal(shape=1, id = 2)

        # goto_fullaction = SimpleActionState('trajectory_action', doTrajAction,
        #                   goal=goto_goal)

        # StateMachine.add('LIL_TRAJ',
        #                   goto_fullaction,
        #                   transitions={'succeeded':'END_IT'})


        # # Kill it now.
        # StateMachine.add('END_IT',
        #         ServiceState('kill_service', actionlib_tutorials.srv.killMotors,
        #             request = actionlib_tutorials.srv.killMotorsRequest(2)),
        #         {'succeeded':'TELEPORT1'})


        # def turtle_far_away(ud, msg):
        #     """Returns True if UNITY STRING is a kill!!!"""
        #     print (msg.data)
        #     if msg.data == "home":
        #         return True
        #     return False

        # StateMachine.add('WAIT_FOR_CLEAR',
        #         MonitorState('/cf2/pattern', String,
        #             cond_cb = lambda ud,msg: not turtle_far_away(ud,msg)),
        #         {'valid':'WAYPOINT3','invalid':'END_IT'})

         # Kill it now.
        # StateMachine.add('END_IT',
        #         ServiceState('kill_service', actionlib_tutorials.srv.killMotors,
        #             request = actionlib_tutorials.srv.killMotorsRequest(2)),
        #         {'succeeded':'WAIT_FOR_CLEAR'})

        # # Teleport turtle 1
        # StateMachine.add('TELEPORT1',
        #         ServiceState('turtle1/teleport_absolute', turtlesim.srv.TeleportAbsolute,
        #             request = turtlesim.srv.TeleportAbsoluteRequest(5.0,1.0,0.0)),
        #         {'succeeded':'WAIT_FOR_CLEAR'})


        # StateMachine.add('WAIT_FOR_CLEAR',
        #         MonitorState('/turtle1/pose',turtlesim.msg.Pose,
        #             cond_cb = lambda ud,msg: not turtle_far_away(ud,msg)),
        #         {'valid':'WAIT_FOR_CLEAR','invalid':'succeeded'})



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

