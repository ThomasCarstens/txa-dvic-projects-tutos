#!/usr/bin/env python

import roslib; #roslib.load_manifest('smach_usecase')

import threading
import rospy
import smach
import smach_ros
from smach_ros import ServiceState, IntrospectionServer, SimpleActionState, MonitorState#, Concurrence
from math import sqrt, pow

import std_srvs.srv
import turtlesim.srv
import turtlesim.msg
import turtle_actionlib.msg

def main():
    rospy.init_node('smach_usecase_executive')
    polygon_big=turtle_actionlib.msg.ShapeGoal(11, 4.0)
    polygon_small=turtle_actionlib.msg.ShapeGoal(6, 0.5)


    sm = smach.StateMachine(outcomes=['succeeded','aborted','preempted'])

    with sm:
	smach.StateMachine.add('SIM_RESET', ServiceState('reset', std_srvs.srv.Empty), {'succeeded':'SPAWNER'})
	smach.StateMachine.add('SPAWNER', ServiceState('spawn', turtlesim.srv.Spawn, request=turtlesim.srv.SpawnRequest(1.0,2.0,0.0, 'turtle2')), {'succeeded':'MOVE_T1'})
        smach.StateMachine.add('MOVE_T1', ServiceState('turtle1/teleport_absolute', turtlesim.srv.TeleportAbsolute, request=turtlesim.srv.TeleportAbsoluteRequest(5.0,1.0,0.0)), {'succeeded':'MOVE_T2'})
        smach.StateMachine.add('MOVE_T2', ServiceState('turtle2/teleport_absolute', turtlesim.srv.TeleportAbsolute, request=turtlesim.srv.TeleportAbsoluteRequest(9.0,5.0,0.0)), {'succeeded':'DRAW_SHAPES'})


# Create the sub SMACH state machine
        sm_con = smach.Concurrence(outcomes=['succeeded', 'preempted', 'aborted'],
                                   default_outcome='succeeded',
                                   outcome_map={'succeeded':
                                       { 'POLYGON_T1':'succeeded',
                                         'KAF':'succeeded'}})
        smach.StateMachine.add('DRAW_SHAPES', sm_con)
        with sm_con:
            # Add states to the container
            smach.Concurrence.add('POLYGON_T1',
                               SimpleActionState('turtle_shape1', turtle_actionlib.msg.ShapeAction,
                                                       goal = polygon_big))
        
# PUT MONITOR and POLYGON_T2 IN CONCURRENCE ############################################################## 
            sm_monitor2 = smach.Concurrence(outcomes=['succeeded', 'preempted', 'aborted'],
 #                                  default_outcome='succeeded',
 #                                  child_termination_cb = lambda so: True,
 #                                  outcome_map={'succeeded': {'POLYGON_T2':'succeeded', 'KAF': 'succeeded'},
 #                                               'preempted':{'POLYGON_T2':'preempted','KAF':'preempted'},
 #                                               'aborted':{'POLYGON_T2':'invalid'}
                                               #}
                                               )
            smach.Concurrence.add('KAF', sm_monitor2)
            with sm_monitor2:
            
              # Add states to the container
              smach.Concurrence.add('POLYGON_T2', SimpleActionState('turtle_shape2', turtle_actionlib.msg.ShapeAction, goal = polygon_small),{'succeeded':'MOVE_T2'})
              #def turtle_far_away(ud, msg):
              #      distance = sqrt(pow(msg.x-9.0,2) + pow(msg.y-5.0,2))
              #      print(distance)
              #      #"""Returns True while turtle pose in msg is at least 1 unit away from (9,5)"""
              #      if distance > 2.0:
              #          print("at least 1 unit away")
              #          return True
              #      else:
              #          print("too close!")
              #          return False
              #smach.Concurrence.add('MONITOR', MonitorState("/turtle1/pose", turtlesim.msg.Pose, cond_cb = turtle_far_away)),
            
              #smach.Concurrence.add('WAIT_FOR_CLEAR',
              #          MonitorState('/turtle1/pose',turtlesim.msg.Pose,
              #              cond_cb = lambda ud,msg: not turtle_far_away(ud,msg)),
              #          {'valid':'WAIT_FOR_CLEAR','invalid':'MOVE_T2'})    


        




        

#        smach.StateMachine.add('POLYGON_T1',
#                               SimpleActionState('turtle_shape1', turtle_actionlib.msg.ShapeAction,
#                                                       goal = turtle_actionlib.msg.ShapeGoal(11, 4.0)),{'succeeded':'POLYGON_T2'})
#        smach.StateMachine.add('POLYGON_T2',
#                               SimpleActionState('turtle_shape2', turtle_actionlib.msg.ShapeAction,
#                                                       goal = turtle_actionlib.msg.ShapeGoal(6, 0.5)))


    sis = IntrospectionServer('server_name', sm, '/SM_ROOT')
    sis.start()
    #outcome = sm.execute()



    # Set preempt handler
    smach_ros.set_preempt_handler(sm)

    # Execute SMACH tree in a separate thread so that we can ctrl-c the script
    smach_thread = threading.Thread(target = sm.execute)
    smach_thread.start()

    rospy.spin()
    #sis.stop()

if __name__ == '__main__':
    main()
