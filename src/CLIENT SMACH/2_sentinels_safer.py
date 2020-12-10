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
    id = int(2)
    #define the differents points
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

    sm_topoftop = StateMachine(outcomes=['succeeded'])

    with sm_topoftop:

        """ PREEMPTION PROCEDURE starts here (see above state for state transition)"""

        string_monitor = Concurrence(
                ['succeeded', ],
                'succeeded',
                child_termination_cb = lambda so: True,
                #outcome_map = {
            #        'succeeded':{'WAIT_FOR_CLEAR':'valid'},
	         #       'aborted':{'WAIT_FOR_CLEAR':'invalid'}}
             )


        StateMachine.add('PREEMPTABLE_MOVE',
                string_monitor,
                {'succeeded':''})


        with string_monitor:


            """MONITOR STATE"""

            def turtle_far_away(ud, msg):
                """Returns True if UNITY STRING is a kill!!!"""
                print (msg.data)
                if msg.data == "home":
                    #SimpleActionClient('togoal', FibonacciAction).send_goal(FibonacciGoal(order=24))
                    return True
                #if msg.data == "kill":
                #    return 'invalid'
                else:
                    if not msg.data:
                        print("sup")
                        return False

            Concurrence.add('WAIT_FOR_CLEAR',
                MonitorState('/cf2/pattern', String,
                    cond_cb = lambda ud,msg: not turtle_far_away(ud,msg)))
                    #transitions={'invalid':'CANCEL_TOGOAL'}),


            """REST OF SM STATE"""

            # pos1 = Point()

            # pos1.x = 0.7
            # pos1.y = 0
            # #pos1.z = 0.5

            # goto_goal = FibonacciGoal(order=2, destination=pos1)
            # goto_fullaction = SimpleActionState('togoal', FibonacciAction,
            #                 goal=goto_goal)

            # Concurrence.add('WAYPOINT3',
            #         goto_fullaction)

            """ PREEMPTION PROCEDURE ends here (see state PREEMPTABLE_MOVE for state transition)"""


            sm_top = StateMachine(outcomes=['succeeded', 'aborted'])

            Concurrence.add('PREEMPTABLE_MOVE',
                    sm_top)#,
                    #{'preempted':'succeeded'})

            # Open the container
            with sm_top:

                # smach.StateMachine.add('BAS', Bas(),
                #                        transitions={'outcome3':'SUB'})

                draw_monitor_cc = Concurrence(
                        ['succeeded', 'preempted'],  #['succeeded','aborted'],
                        'succeeded',
                        #child_termination_cb = lambda so: True,
                        #outcome_map = {
                        #    'succeeded':{'CRAZYFLIE2':'succeeded'},
                        #    'aborted':{'CRAZYFLIE3':'succeeded'}}
                    )

                StateMachine.add('PREEMPTABLE_MOVE',
                        draw_monitor_cc,
                        {'preempted':'succeeded'})


                with draw_monitor_cc:
                    # CRAZYFLIE 2
                # Create a SMACH state machine
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


                    # CRAZYFLIE 3
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





    # Attach a SMACH introspection server
    sis_sm_topoftop = IntrospectionServer('smach_usecase_sm_top', sm_topoftop, '/sm_top_IS')
    sis_sm_topoftop.start()

    # Set preempt handler
    smach_ros.set_preempt_handler(sm_topoftop)

    # Execute SMACH tree in a separate thread so that we can ctrl-c the script
    sm_topoftop_thread = threading.Thread(target = sm_topoftop.execute)
    sm_topoftop_thread.start()


# def cf3_polygonial():
#     id = int(3)
#     #define the differents points
#     my_points2 = [Point(), Point(), Point(), Point()]

#     my_points2[0].x = -0.5
#     my_points2[0].y = 0.2
#     my_points2[0].z = 0.5

#     my_points2[1].x = -0.5
#     my_points2[1].y = -0.5
#     my_points2[1].z = 0.5

#     my_points2[2].x = 0.0
#     my_points2[2].y = -0.5
#     my_points2[2].z = 0.5

#     my_points2[3].x = 0.0
#     my_points2[3].y = 0.2
#     my_points2[3].z = 0.5




#     # Attach a SMACH introspection server
#     sis3 = IntrospectionServer('smach_usecase_03', sm3, '/sm3_IS')
#     sis3.start()

#     # Set preempt handler
#     smach_ros.set_preempt_handler(sm3)

#     # Execute SMACH tree in a separate thread so that we can ctrl-c the script
#     sm3_thread = threading.Thread(target = sm3.execute)
#     sm3_thread.start()


if __name__ == '__main__':
    rospy.init_node('smach_usecase_step_06')

    tcf2 = threading.Thread(target=cf2_polygonial)
    tcf2.start()

    # tcf3 = threading.Thread(target=cf3_polygonial)
    # tcf3.start()

    rospy.spin()
