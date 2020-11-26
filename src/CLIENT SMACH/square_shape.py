#! /usr/bin/env python
from __future__ import print_function
import rospy

import threading
from math import sqrt, pow
import smach_ros
import smach

import actionlib
from actionlib_tutorials.msg import MoveToAction, MoveToGoal, MachineAction, FibonacciAction, FibonacciGoal
from geometry_msgs.msg import Point
from smach import StateMachine, Concurrence
from smach_ros import ActionServerWrapper, ServiceState, SimpleActionState, MonitorState, IntrospectionServer
import std_srvs.srv
import turtlesim.srv
import turtlesim.msg
import turtle_actionlib.msg

def polygonial():
    #define the differents points
    my_points = [Point(), Point(), Point(), Point()]

    my_points[0].x = 0.5
    my_points[0].y = 0.0
    my_points[0].z = 0.5

    my_points[1].x = 0.5
    my_points[1].y = 0.5
    my_points[1].z = 0.5

    my_points[2].x = 0.0
    my_points[2].y = 0.5
    my_points[2].z = 0.5

    my_points[3].x = 0.0
    my_points[3].y = 0.0
    my_points[3].z = 0.5

    # Create a SMACH state machine
    sm0 = StateMachine(outcomes=['succeeded','aborted','preempted'])

    # Open the container
    with sm0:
        #add each state
        for i in range(3):
            StateMachine.add('STATE' + str(i),
                            SimpleActionState('detect_perimeter',
                                                MoveToAction, goal = MoveToGoal(point = my_points[i])
                            transitions={'succeeded' : 'STATE' + str(i+1)})

        #make it infinit
        StateMachine.add('STATE' + str(3),
                        SimpleActionState('detect_perimeter',
                                            MoveToAction, goal = MoveToGoal(point = my_points[3])
                        transitions={'succeeded' : 'STATE' + str(0)})



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
