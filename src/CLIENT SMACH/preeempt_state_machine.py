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
import tf

def cf2_polygonial():
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

    main_sm = Concurrence(outcomes = ['succeeded', 'preempted'], default_outcome = 'succeeded', child_termination_cb = True)

    with main_sm:
        sm2 = StateMachine(outcomes = 'preempted')
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

        sm3 = StateMachine(outcomes=['preempted'])

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

        def get_cf2_pose(ud, msg):
            cf = data.transforms[0]
            if cf.child_frame_id == 'cf2':
                if cf.transform.translation.x > 1 or cf.transform.translation.x < -1 or cf.transform.translation.y > 1 or cf.transform.translation.y < -1 or cf.transform.translation.z > 1 or cf.transform.translation.z < -1:
                    return True
                else:
                    return False

        def get_cf3_pose(ud, msg):
            cf = data.transforms[0]
            if cf.child_frame_id == 'cf3':
                if cf.transform.translation.x > 1 or cf.transform.translation.x < -1 or cf.transform.translation.y > 1 or cf.transform.translation.y < -1 or cf.transform.translation.z > 1 or cf.transform.translation.z < -1:
                    return True
                else:
                    return False

        Concurrence.add('cf2_move', sm2)
        Concurrence.add('cf3_move', sm3)
        Concurrence.add('monitor_cf2', MonitorState('/tf', tf2_msgs.msg.TFMessage, cond_cb = get_cf2_pose))
        Concurrence.add('monitor_cf3', MonitorState('/tf', tf2_msgs.msg.TFMessage, cond_cb = get_cf3_pose))

    # Attach a SMACH introspection server
    sis = IntrospectionServer('state_machine_preemption', main_sm, '/sm_top_IS')
    sis.start()

    # Set preempt handler
    smach_ros.set_preempt_handler(main_sm)

    # Execute SMACH tree in a separate thread so that we can ctrl-c the script
    thread = threading.Thread(target = main_sm.execute)
    thread.start()


if __name__ == '__main__':
    rospy.init_node('state_machine_preemption')

    tcf2 = threading.Thread(target=cf2_polygonial)
    tcf2.start()

    # tcf3 = threading.Thread(target=cf3_polygonial)
    # tcf3.start()

    rospy.spin()
