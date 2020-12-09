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
from actionlib_msgs.msg import GoalID



def polygonial():

    print("di")
    # Construct static goals
    polygon_big = turtle_actionlib.msg.ShapeGoal(edges = 11, radius = 4.0)
    polygon_small = turtle_actionlib.msg.ShapeGoal(edges = 6, radius = 0.5)

    # Create a SMACH state machine
    sm0 = StateMachine(outcomes=['succeeded','aborted','preempted', 'cancel_outcome'])

    with sm0:

        #Reset turtlesim
        StateMachine.add('RESET',
               ServiceState('reset', std_srvs.srv.Empty),
               {'succeeded':'SPAWN'})

        # Create a second turtle
        StateMachine.add('SPAWN',
                ServiceState('spawn', turtlesim.srv.Spawn,
                    request = turtlesim.srv.SpawnRequest(5.0,2.0,0.0,'turtle2')),
                {'succeeded':'PREEMPTABLE_MOVE'})

        #def child_term_cb():
        #    time.sleep(3.0)

        draw_monitor_cc = Concurrence(
                ['succeeded', 'aborted'],  #['succeeded','aborted'],
                'succeeded',
                #child_termination_cb = child_term_cb,
                #child_termination_cb = lambda so: True,
                #outcome_map = {
                #    'succeeded':{'CRAZYFLIE2':'succeeded'},
	            #    'aborted':{'CRAZYFLIE3':'succeeded'}}
             )

        StateMachine.add('PREEMPTABLE_MOVE',
                draw_monitor_cc,
                {'succeeded':''})


        with draw_monitor_cc:
            # CRAZYFLIE 2
        # Create a SMACH state machine
            sm2 = StateMachine(outcomes=['succeeded','aborted','preempted'])  # ['succeeded','aborted','preempted']



            Concurrence.add('CRAZYFLIE2', sm2,

                                #transitions={'outcome4':'outcome5'}
                                )

            # Open the container
            with sm2:
                my_points2 = [Point(), Point(), Point(), Point()]

                my_points2[0].x = 2.0
                my_points2[0].y = 1.0
                #my_points2[0].z = 0.5

                my_points2[1].x = 1.5
                my_points2[1].y = 1.0
                #my_points2[1].z = 0.5

                my_points2[2].x = 1.0
                my_points2[2].y = 2.0
                #my_points2[2].z = 0.5

                my_points2[3].x = 5.0
                my_points2[3].y = 1.0
                #my_points2[3].z = 0.5

                #add each state
                for i in range(3):
                    StateMachine.add('CF2STATE' + str(i),
                                    SimpleActionState('togoal',
                                                        FibonacciAction, goal = FibonacciGoal(order=1, destination=my_points2[i])),
                                    transitions={'succeeded' : 'CF2STATE' + str(i+1)})

                #make it infinit
                StateMachine.add('CF2STATE' + str(3),
                                SimpleActionState('togoal',
                                                    FibonacciAction, goal = FibonacciGoal(order=1, destination=my_points2[3])),
                                transitions={'succeeded' : 'CF2STATE' + str(0)})




            # CRAZYFLIE 3
            # Create a SMACH state machine
            sm3 = StateMachine(outcomes=['succeeded','aborted','preempted'])  # ['succeeded','aborted','preempted']

            Concurrence.add('CRAZYFLIE3', sm3#,
                                #transitions={'outcome4':'outcome5'}
                                )

            # Open the container
            with sm3:
                my_points2 = [Point(), Point(), Point(), Point()]

                my_points2[0].x = 2.0
                my_points2[0].y = 1.0
                #my_points2[0].z = 0.5

                my_points2[1].x = 1.0
                my_points2[1].y = 1.0
                #my_points2[1].z = 0.5

                my_points2[2].x = 1.0
                my_points2[2].y = 2.0
                #my_points2[2].z = 0.5

                my_points2[3].x = 5.0
                my_points2[3].y = 1.0
                #my_points2[3].z = 0.5

                #add each state
                for i in range(3):
                    StateMachine.add('CF3STATE' + str(i),
                                    SimpleActionState('togoal',
                                                        FibonacciAction, goal = FibonacciGoal(order=2, destination=my_points2[i])),
                                    transitions={'succeeded' : 'CF3STATE' + str(i+1)})

                #make it infinit
                StateMachine.add('CF3STATE' + str(3),
                                SimpleActionState('togoal1',
                                                    FibonacciAction, goal = FibonacciGoal(order=2, destination=my_points2[3])),
                                transitions={'succeeded' : 'CF3STATE' + str(0)})


        #
        # draw_monitor_cc = Concurrence(
        #         ['succeeded','aborted'],
        #         'aborted',
        #         child_termination_cb = lambda so: True,
        #         #outcome_map = {
        #     #        'succeeded':{'WAIT_FOR_CLEAR':'valid'},
	    #      #       'aborted':{'WAIT_FOR_CLEAR':'invalid'}}
        #      )
        #
        #
        # StateMachine.add('PREEMPTABLE_MOVE',
        #         draw_monitor_cc,
        #         {'aborted':'TELEPORT2'})
        #
        #
        # with draw_monitor_cc:
        #
        #
        #     pos1 = Point()
        #
        #     pos1.x = 0.7
        #     pos1.y = 0
        #     pos1.z = 0.5
        #
        #     goto_goal = FibonacciGoal(order=20)
        #     goto_fullaction = SimpleActionState('togoal', FibonacciAction,
        #                     goal=goto_goal)
        #
        #     Concurrence.add('WAYPOINT3',
        #             goto_fullaction)
        #
        #     def turtle_far_away(ud, msg):
        #         """Returns True if UNITY STRING is a kill!!!"""
        #         print (msg.data)
        #         if msg.data == "home":
        #             #SimpleActionClient('togoal', FibonacciAction).send_goal(FibonacciGoal(order=24))
        #             return True
        #         #if msg.data == "kill":
        #         #    return 'invalid'
        #         else:
        #             if not msg.data:
        #                 print("sup")
        #                 return False
        #
        #     Concurrence.add('WAIT_FOR_CLEAR',
        #         MonitorState('/cf2/pattern', String,
        #             cond_cb = lambda ud,msg: not turtle_far_away(ud,msg)))
        #             #transitions={'invalid':'CANCEL_TOGOAL'}),

         # Teleport turtle 1


        StateMachine.add('TELEPORT2',
                ServiceState('turtle2/teleport_absolute', turtlesim.srv.TeleportAbsolute,
                    request = turtlesim.srv.TeleportAbsoluteRequest(5.0,8.0,0.0)),
                {'succeeded':'PREEMPTABLE_MOVE'})











    # Attach a SMACH introspection server
    sis = IntrospectionServer('smach_usecase_01', sm0, '/USE_CASE')
    sis.start()

    # Set preempt handler
    smach_ros.set_preempt_handler(sm0)

    # Execute SMACH tree in a separate thread so that we can ctrl-c the script
    smach_thread = threading.Thread(target = sm0.execute)
    smach_thread.start()



if __name__ == '__main__':
    rospy.init_node('smtesting')
    t1 = threading.Thread(target=polygonial)
    t1.start()
    rospy.spin()
