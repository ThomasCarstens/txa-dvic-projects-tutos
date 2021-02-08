"""
TXA, NOVEMBRE 2020
2 DRONES: CF3 DOES A SQUARE, AND WHEN TRIGGERED BY /swarmfollow WILL FOLLOW CF2
10/12/2020: Functional.
08/02/2021: Added comments
"""

#! /usr/bin/env python
from __future__ import print_function
import rospy

import threading
from math import sqrt, pow
import smach_ros
import smach

import actionlib
from actionlib_tutorials.msg import my_newAction, my_newGoal, MachineAction#, FibonacciAction, FibonacciGoal
from geometry_msgs.msg import Point
from smach import StateMachine, Concurrence
from smach_ros import ActionServerWrapper, ServiceState, SimpleActionState, MonitorState, IntrospectionServer
import std_srvs.srv
import turtlesim.srv
import turtlesim.msg
import turtle_actionlib.msg
import sys
from std_msgs.msg import String

def cf2_polygonial():
    id = int(2) # custom Drone ID, e.g. 2 for cf2

    #define 4 squares as list of points.
    my_points3 = [Point(), Point(), Point(), Point()]

    my_points3[0].x = 0.5
    my_points3[0].y = 0.0
    my_points3[0].z = 0.5

    my_points3[1].x = 0.5
    my_points3[1].y = 0.5
    my_points3[1].z = 0.5

    my_points3[2].x = 0.0
    my_points3[2].y = 0.5
    my_points3[2].z = 0.5

    my_points3[3].x = 0.0
    my_points3[3].y = 0.2
    my_points3[3].z = 0.5


    my_points2 = [Point(), Point(), Point(), Point()]

    my_points2[0].x = -0.5
    my_points2[0].y = 0.2
    my_points2[0].z = 0.5

    my_points2[1].x = -0.5
    my_points2[1].y = -0.5
    my_points2[1].z = 0.5

    my_points2[2].x = 0.0
    my_points2[2].y = -0.5
    my_points2[2].z = 0.5

    my_points2[3].x = 0.0
    my_points2[3].y = -0.2
    my_points2[3].z = 0.5

    my_points1 = [Point(), Point(), Point(), Point()]

    my_points1[0].x = -0.5
    my_points1[0].y = 0.2
    my_points1[0].z = 0.5

    my_points1[1].x = -0.5
    my_points1[1].y = -0.5
    my_points1[1].z = 0.5

    my_points1[2].x = 0.0
    my_points1[2].y = -0.5
    my_points1[2].z = 0.5

    my_points1[3].x = 0.0
    my_points1[3].y = 0.2
    my_points1[3].z = 0.5

    # Create the top level SMACH state machine

    sm_topoftop = StateMachine(outcomes=['succeeded', 'aborted', 'preempted'])

    with sm_topoftop:

        """ PREEMPTION PROCEDURE: first, a concurrence. One state is FOLLOW_STATE
        and it executes when the other state is preempted: PREEMPTABLE_MOVE.

        PREEMPTABLE_MOVE is divided into a concurrence: WAIT_FOR_CLEAR monitors a ROS topic to wait for a trigger,
        and the other state Puts CRAZYFLIE2 and CRAZYFLIE3 in Concurrence.

        Not sure why but I also called that state PREEMPTABLE_MOVE.
        """

        string_monitor = Concurrence(
                ['succeeded', ],
                'succeeded',
                child_termination_cb = lambda so: True, #stop child execution if true.
                #outcome_map = {
            #        'succeeded':{'WAIT_FOR_CLEAR':'valid'},
	         #       'aborted':{'WAIT_FOR_CLEAR':'invalid'}}
             )

        """ FOR DEMO: CF3 FOLLOWS CF2 IF ACTION IS PREEMPTED."""

        StateMachine.add('FOLLOW_STATE',
                        SimpleActionState('cf3_follow_cf2',
                                            my_newAction, goal = my_newGoal(point = my_points3[3], id = 3))
                        )

        StateMachine.add('PREEMPTABLE_MOVE',
                string_monitor,
                {'succeeded':'FOLLOW_STATE'})


        with string_monitor:
            """MONITOR STATE"""

            def turtle_far_away(ud, msg):
                """Returns True if /swarmfollow message says FOLLOW_ME"""
                print (msg.data)
                if msg.data == "FOLLOW_ME":
                    #SimpleActionClient('togoal', FibonacciAction).send_goal(FibonacciGoal(order=24))
                    return True
                #if msg.data == "kill":
                #    return 'invalid'
                else:
                    if not msg.data:
                        print("sup")
                        return False

            """Start ROS monitoring"""
            Concurrence.add('WAIT_FOR_CLEAR',
                MonitorState('/swarmfollow', String,
                    cond_cb = lambda ud,msg: not turtle_far_away(ud,msg)))
                    #transitions={'invalid':'CANCEL_TOGOAL'}),

            sm_top = StateMachine(outcomes=['succeeded', 'aborted', 'preempted']) #11DEC: adding preempted

            """Add the REST as a SM."""
            Concurrence.add('PREEMPTABLE_MOVE',
                    sm_top)#,
                    #{'preempted':'succeeded'})

            # Open the container
            with sm_top:

                draw_monitor_cc = Concurrence(
                        ['succeeded', 'preempted'],  #['succeeded','aborted'],
                        'succeeded',
                        #child_termination_cb = lambda so: True,
                        #outcome_map = {
                        #    'succeeded':{'CRAZYFLIE2':'succeeded'},
                        #    'aborted':{'CRAZYFLIE3':'succeeded'}}
                    )

                """CONCURRENCE Designed To Fly multiple drones SIMULTANEOUSLY."""
                StateMachine.add('PREEMPTABLE_MOVE',
                        draw_monitor_cc,
                        {'succeeded':'succeeded'})

                with draw_monitor_cc:

                    """CRAZYFLIE 2 SQUARE."""
                    sm2 = StateMachine(outcomes=['succeeded','aborted','preempted'])  # ['succeeded','aborted','preempted']


                    Concurrence.add('CRAZYFLIE2', sm2#,
                                        #transitions={'outcome4':'outcome5'}
                                        )

                    # Open the container
                    with sm2:
                        #add each state
                        for i in range(3):
                            StateMachine.add('CF2STATE' + str(i),
                                            SimpleActionState('detect_perimeter',
                                                                my_newAction, goal = my_newGoal(point = my_points2[i], id = 2)),
                                            transitions={'succeeded' : 'CF2STATE' + str(i+1)})

                        #make it infinit
                        smach.StateMachine.add('CF2STATE' + str(3),
                                        SimpleActionState('detect_perimeter',
                                                            my_newAction, goal = my_newGoal(point = my_points2[3], id = 2)),
                                        transitions={'succeeded' : 'CF2STATE' + str(0)})


                    """CRAZYFLIE 3 SQUARE."""
                    # Create a SMACH state machine
                    sm3 = StateMachine(outcomes=['succeeded','aborted','preempted'])  # ['succeeded','aborted','preempted']

                    Concurrence.add('CRAZYFLIE3', sm3#,
                                        #transitions={'outcome4':'outcome5'}
                                        )

                    # Open the container
                    with sm3:
                        #add each state
                        for i in range(3):
                            StateMachine.add('CF3STATE' + str(i),
                                            SimpleActionState('detect_perimeter1',
                                                                my_newAction, goal = my_newGoal(point = my_points3[i], id = 3)),
                                            transitions={'succeeded' : 'CF3STATE' + str(i+1)})

                        #make it infinit
                        StateMachine.add('CF3STATE' + str(3),
                                        SimpleActionState('detect_perimeter1',
                                                            my_newAction, goal = my_newGoal(point = my_points3[3], id = 3)),
                                        transitions={'succeeded' : 'CF3STATE' + str(0)})



""" END OF SMACH STRUCTURE: ADD OTHER THINGS """

    # Attach a SMACH introspection server
    sis_sm_topoftop = IntrospectionServer('smach_usecase_sm_top', sm_topoftop, '/sm_top_IS')
    sis_sm_topoftop.start()

    # Set preempt handler
    smach_ros.set_preempt_handler(sm_topoftop)

    # Execute SMACH tree in a separate thread so that we can ctrl-c the script
    sm_topoftop_thread = threading.Thread(target = sm_topoftop.execute)
    sm_topoftop_thread.start()



if __name__ == '__main__':
    rospy.init_node('smach_usecase_step_06')

    tcf2 = threading.Thread(target=cf2_polygonial)
    tcf2.start()

    rospy.spin()
