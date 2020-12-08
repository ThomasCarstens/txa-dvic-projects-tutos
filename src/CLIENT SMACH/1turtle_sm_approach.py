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


class CancelGoal(smach.State):
  def  __init__(self):
    smach.State.__init__(self, outcomes=['cancel_outcome'])
    self.cancel_pub = rospy.Publisher('togoal/cancel', GoalID, queue_size=10)

  def execute(self, userdata):
     #setCancelState(True)
     goalId = GoalID()
     self.cancel_pub.publish(goalId)
     return 'cancel_outcome'



def polygonial():

    print("di")
    # Construct static goals
    polygon_big = turtle_actionlib.msg.ShapeGoal(edges = 11, radius = 4.0)
    polygon_small = turtle_actionlib.msg.ShapeGoal(edges = 6, radius = 0.5)

    # Create a SMACH state machine
    sm0 = StateMachine(outcomes=['succeeded','aborted','preempted', 'cancel_outcome'])

    # Open the container
    # with sm0:
    #     #add each state
    #     for i in range(3):
    #         StateMachine.add('STATE' + str(i),
    #                         SimpleActionState('detect_perimeter',
    #                                             my_newAction, goal = my_newGoal(point = my_points[i], id = id)),
    #                         transitions={'succeeded' : 'STATE' + str(i+1)})
    #
    #     #make it infinit
    #     StateMachine.add('STATE' + str(3),
    #                     SimpleActionState('detect_perimeter',
    #                                         my_newAction, goal = my_newGoal(point = my_points[3], id = id)),
    #                     transitions={'succeeded' : 'STATE' + str(0)})
    # Open the container
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



        # for i in range(3):
        #     StateMachine.add('STATE' + str(i),
        #                     SimpleActionState('detect_perimeter',
        #                                         my_newAction, goal = my_newGoal(point = my_points[i], id = id)),
        #                     transitions={'succeeded' : 'STATE' + str(i+1)})



        draw_monitor_cc = Concurrence(
                ['succeeded','aborted'],
                'aborted',
                child_termination_cb = lambda so: True,
                #outcome_map = {
            #        'succeeded':{'WAIT_FOR_CLEAR':'valid'},
	         #       'aborted':{'WAIT_FOR_CLEAR':'invalid'}}
             )


        StateMachine.add('PREEMPTABLE_MOVE',
                draw_monitor_cc,
                {'aborted':'TELEPORT2'})


        with draw_monitor_cc:


            pos1 = Point()

            pos1.x = 0.7
            pos1.y = 0
            #pos1.z = 0.5

            goto_goal = FibonacciGoal(order=2, destination=pos1)
            goto_fullaction = SimpleActionState('togoal', FibonacciAction,
                            goal=goto_goal)

            Concurrence.add('WAYPOINT3',
                    goto_fullaction)

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

            #Concurrence.add('CANCEL_TOGOAL', CancelGoal())

                #{'valid':'valid', 'invalid':'succeeded', 'preempted':'preempted'}

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

        StateMachine.add('CANCEL', CancelGoal(),  transitions={'cancel_outcome':''})
        StateMachine.add('TELEPORT2',
                ServiceState('turtle2/teleport_absolute', turtlesim.srv.TeleportAbsolute,
                    request = turtlesim.srv.TeleportAbsoluteRequest(5.0,8.0,0.0)),
                {'succeeded':'PREEMPTABLE_MOVE'})



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
