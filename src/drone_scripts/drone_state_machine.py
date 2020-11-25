#! /usr/bin/env python
from __future__ import print_function
import rospy

import threading
from math import sqrt, pow
import smach_ros
import smach


#REQUIRED
#Basic Msgs:        CfPose.msg,   KillMotors.srv, 

#REQUIRED
#Action Msgs:      GoHomeAction,    KillAction, StayFixedAction,  TrajectoryAction,   FollowAction
#Goal: 			[cf#]	       [cf#]		[cf#]	  [cf#, Traj Number]  [cf1, rb#]
#Feedback:		 [dist_home]	 [/]	  [secs still]  [traj completion]    [secs follow]
#Results: 		 [isHome] 	[isOff]	 	[/]	    [isComplete]	[/]

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



                    def drone_in_perimeter(ud, msg):
			"""Detect if drone is on limits of arena"""
			"""Arena boundaries are (+-1.5,:,:), (:,+-1.0,:), (:,:,[0:1.5])"""
                        """Returns True while drone pose in msg is at least 0.1 unit away from (0,0,1)"""
                        if sqrt(pow(msg.x-0.0,2) + pow(msg.y-0.0,2) + pow(msg.z-1.0,2)) > 0.1:
                            return True
                        return False

		# Monitor Drone Position
                StateMachine.add('ZONE_ENTRY_MONITOR',
                        MonitorState('/cf2/pose', cfPose,
                            cond_cb = lambda ud,msg: not drone_in_perimeter(ud,msg)),
                        {'valid':'DO_TRAJ','invalid':'ZONE_ENTRY_MONITOR'})

        	#TrajectoryAction
		dotraj_goal = TrajectoryGoal(shape="helicoidal")
		dotraj_fullaction = SimpleActionState('togoal', TrajectoryAction,
		                  goal=dotraj_goal)

		StateMachine.add('DO_TRAJ',
		                  dotraj_fullaction,
		                  transitions={'succeeded':'TELEPORT1'},{'preempted':'ZONE_ENTRY_MONITOR'})

        	#FollowAction
		follow_goal = FollowGoal(me="cf2", them="cf3")
		follow_fullaction = SimpleActionState('togoal', FollowAction,
		                  goal=follow_goal)

		StateMachine.add('FOLLOW_ME',
		                  follow_fullaction,
		                  transitions={'succeeded':'TELEPORT1'},{'preempted':'ZONE_ENTRY_MONITOR'})

        	#StayFixedAction
		stayFixed_goal = StayFixedGoal(me="cf2")
		stayFixed_fullaction = SimpleActionState('togoal', StayFixedAction,
		                  goal=stayFixed_goal)

		StateMachine.add('FOLLOW_ME',
		                  stayFixed_fullaction,
		                  transitions={'succeeded':'TELEPORT1'},{'preempted':'ZONE_ENTRY_MONITOR'})



                    def drone_out_of_bounds(ud, msg):
			"""Detect if drone is on limits of arena"""
			"""Arena boundaries are (+-1.5,:,:), (:,+-1.0,:), (:,:,[0:1.5])"""
                        """Returns True while drone pose in msg is at least 0.3 unit away from x=(+1.5)"""
                        if sqrt(pow(msg.x-1.5,2) + pow(msg.y-5.0,2) + pow(msg.z-5.0,2)) > 0.3:
                            return True
                        return False

                    Concurrence.add('MONITOR',
                            MonitorState('/cf2/pose', cfPose,
                                cond_cb = drone_out_of_bounds))

		# Monitor Proximity to Borders
                StateMachine.add('BORDERS_MONITOR',
                        MonitorState('/cf2/pose', cfPose,
                            cond_cb = lambda ud,msg: not turtle_far_away(ud,msg)),
                        {'valid':'GOHOME','invalid':'TELEPORT2'})

                    def unity_go_home(ud, msg):
			"""Detect if drone is on limits of arena"""
			"""Arena boundaries are (+-1.5,:,:), (:,+-1.0,:), (:,:,[0:1.5])"""
                        """Returns True while drone pose in msg is at least 0.1 unit away from (0,0,1)"""
                        if msg.data == "home":
                            return True
                        return False

		# Monitor Unity3D string for "home"
                StateMachine.add('COLLISION_MITIGATION',
                        MonitorState('/cf2/pattern', String,
                            cond_cb = lambda ud,msg: not unity_go_home(ud,msg)),
                        {'valid':'GOHOME','invalid':'COLLISION_MITIGATION'})

        	#goHomeAction
		gohome_goal = GoHomeGoal(order=20)
		gohome_fullaction = SimpleActionState('togoal', GoHomeAction,
		                  goal=gohome_goal)

		StateMachine.add('GOHOME',
		                  gohome_fullaction,
		                  transitions={'succeeded':'TELEPORT1'})



                    def drone_nearing_collision(ud, msg):
			"""Arena boundaries are (+-1.5,:,:), (:,+-1.0,:), (:,:,[0:1.5])"""
                        """Returns True while drone pose in msg is at least 0.1 unit away from (0,0,1)"""
                        if sqrt(pow(msg.x-msg.x,2) + pow(msg.y-msg.y,2) + pow(msg.z-msg.z,2)) > 0.1:
                            return True
                        return False

		# Monitor for Near Collision
                StateMachine.add('COLLISION_PREVENTION',
                        MonitorState('/cf2/pose', cfPose,
                            cond_cb = lambda ud,msg: not drone_nearing_collision(ud,msg)),
                        {'valid':'WAIT_FOR_CLEAR','invalid':'TELEPORT2'})





                    def unity_kill_motors(ud, msg):
			"""Detect if drone is on limits of arena"""
			"""Arena boundaries are (+-1.5,:,:), (:,+-1.0,:), (:,:,[0:1.5])"""
                        """Returns True while drone pose in msg is at least 0.1 unit away from (0,0,1)"""
                        if msg.data == "kill":
                            return True
                        return False

		# Monitor Unity3D string for "kill"
                StateMachine.add('COLLISION_MITIGATION',
                        MonitorState('/cf2/pattern', String,
                            cond_cb = lambda ud,msg: not unity_kill_motors(ud,msg)),
                        {'valid':'KILL_MOTORS','invalid':'TELEPORT2'})

		# Service: Kill Motors
		StateMachine.add('KILL_MOTORS',
		        ServiceState('turtle1/teleport_absolute', cfDrone.srv.KillMotors,
		            request = turtlesim.srv.TeleportAbsoluteRequest(5.0,1.0,0.0)),
		        {'succeeded':'DRAW_SHAPES'})

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
