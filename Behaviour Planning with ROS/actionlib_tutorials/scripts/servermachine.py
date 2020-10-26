#! /usr/bin/env python
from __future__ import print_function
import rospy

import threading
from math import sqrt, pow
import smach_ros
import smach
#from machine.action import MachineAction

import actionlib
from actionlib_tutorials.msg import MachineAction, LidarAction, LidarGoal
#include <actionlib_tutorials/AveragingAction.h>
from smach import StateMachine, Concurrence
from smach_ros import ActionServerWrapper, ServiceState, SimpleActionState, MonitorState, IntrospectionServer
import std_srvs.srv
import turtlesim.srv
import turtlesim.msg
import turtle_actionlib.msg

import roslib
#roslib.load_manifest('my_package')
import sys
import numpy as np
import cv2
from std_msgs.msg import String
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

##################################################
###################################################
###################################################

class image_converter:

  def __init__(self):
    #global xR
    self.image_pub = rospy.Publisher("image_topic_2",Image, queue_size=1000)

    self.gate_pub= rospy.Publisher("gate_state", String, queue_size=10);
    self.bridge = CvBridge()
    
    self.image_sub = rospy.Subscriber("rrbot/camera1/image_raw",Image,self.callback)
    


  def callback(self,data):
    global xR, yR, wR, hR
    #global xR
    global forward
    global rotation
    #print("init xR", xR)
    try:
      cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
    except CvBridgeError as e:
      print(e)
    hsv = cv2.cvtColor(cv_image, cv2.COLOR_BGR2HSV) #Camera video to HSV
    redmask = cv2.inRange(hsv, l_b2, u_b2)
    #-----Reduce Noise using morphology opening-----
    R_opening_masked_img = cv2.morphologyEx(redmask, cv2.MORPH_OPEN, kernel)
    #-----Resulting image-----
    R_masked_img = cv2.bitwise_and(cv_image, cv_image, mask=redmask)
    #-----Finding contours and drawing it on the result image-----    
    (R_contours, R_hierarchy) = cv2.findContours(R_opening_masked_img, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    #cv2.drawContours(masked_img, contours, -1, (255,255,255), 3)
    for contours in R_contours:
        (x, y, w, h) = cv2.boundingRect(contours)  # sauvegarder coordonnees contours
        if w>100:
                #print(x,y,w,h, data.width)
		#if cv2.contourArea(contours) < 3500:  # supprimer les petits contours, supprimer le bruit
		#    continue
                x2 = x + (w/2)
                y2 = y + (h/2)
                x2 = int(round(x2))
                y2 = int(round(y2))

                deviation = float(x2 - (data.width / 2))
                #print(deviation);
                velocity= float(2*(deviation)/data.width);
                #print ("func", velocity);
                #destination=1
		if (abs(deviation)>5) and w<400: #If looking away from obstacle
			#no forward velocity
                        forward=0.0;
			if deviation>5:
				rotation=-0.5;
			if deviation<5:
				rotation=0.5;
		else: #if looking at obstacle
			#no rotation 
                        rotation=0.0;       		
			#forward=abs(1-velocity); #accelerate
                        forward=0.7
                
		#rotation=0.0;
                                    # INTERFACE #########################################
                cv2.line(cv_image,(400,480),(x2,y2),(0,255,0),1)
                font = cv2.FONT_HERSHEY_COMPLEX
                if -velocity<0 :
                    text = 'Gauche'
                else :
                    text = 'Droite'
                cv2.putText(cv_image, text, (20, 20), font, 1, (0, 255, 0), 1, cv2.LINE_4)
                cv2.rectangle(cv_image, (x, y), (x + w, y + h), (0, 255, 0), 2)
		
		#cv2.drawContours(frame, contours, -1, (0,255,0), 2)#dessiner contours
                                   # DESTINATION EXISTENCE ###############################
        #else:
	        #destination=0
    #cv2.imshow("Red_maskimg", R_masked_img)
    cv2.imshow("Original", cv_image)
    cv2.waitKey(1)
    #return destination	
    if (R_contours):
          for contours in R_contours:
            #print(contours)
            (x, y, w, h) = cv2.boundingRect(contours) 
            #print("wR", w)
# sauvegarder coordonnees contours
            if w>100:
               (xR, yR, wR, hR)=(x, y, w, h)
               #global xR
               #xR=x
               destination =1
            else:
               destination =0
            #print("if", xR)
    #else:
            #print("else", xR)
    #print ("then", xR)
    #return xR
          

    try:
      #self.image_pub.publish(self.bridge.cv2_to_imgmsg(G_masked_img, "bgr8"))
      self.twist_pub.publish(twist_vel);
      
      
    #except CvBridgeError as e:
    #    print(e)

##############################
###############################
############################################
def polygonial():
    #global xR

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
                    request = turtlesim.srv.SpawnRequest(0.0,0.0,0.0,'turtle2')),
                {'succeeded':'MONITOR_RED'})

        def find_red(ud, msg):
          """Returns True when /go node is set to go"""
          
          if msg.data == "go":
               print ("find_red initiated")
               
               #xR=image_converter()
               #rospy.sleep (5)
                  
               print(xR)
               if (xR) in globals(): #Only works for one obstacle...
                  print ("wR", wR)
                  print ("plus", velocity);
                  #do the analysis
                  #publish velocity.
                  return False
    
          return True

        StateMachine.add('MONITOR_RED',
                  MonitorState('/go', String,
                     cond_cb = find_red),
                      {'valid':'MONITOR_RED','invalid':'APPROACH_RED'})

        def approach_red(ud, msg):
          """Returns True when /go node is set to go"""
          print(msg.ranges[0], msg.ranges[719])
          if msg.ranges[0] < 3 and msg.ranges[719] < 3:
               return False
          else:
                  print ("approach_red initiated")
               
               #xR=image_converter()
               #rospy.sleep (5)
               #if (xR): #Only works for one obstacle...
                  print ("wR 22", wR)
                  print ("plus", forward);
                  print ("plus", rotation);
                  #do the analysis
                  #publish velocity.
                  twist_vel.angular.z= rotation
                  twist_vel.linear.x= forward
                  twist_pub.publish(twist_vel);
                  
    
          return True


        StateMachine.add('APPROACH_RED',
                  MonitorState('/scan', LaserScan,
                     cond_cb = approach_red),
                      {'valid':'APPROACH_RED','invalid':'TELEPORT1'})

# TRYING TO EXECUTE ACTION-FEEDBACK... Have to come back to this later.
        def lidar_callback(userdata, default_goal):
            goal = LidarGoal()
            print("goal", goal)
            #goal.goal = 2
            #while (leftside < 3):
            #  rospy.sleep(1)
            return goal

#        smach.StateMachine.add('WAIT_FOR_GATEPASS',
#                           SimpleActionState('my_action_server_name', LidarAction,
#                                                       goal_cb = lidar_callback),
#                               {'succeeded':'TELEPORT1'})

        # Teleport turtle 1
        StateMachine.add('TELEPORT1',
                ServiceState('turtle1/teleport_absolute', turtlesim.srv.TeleportAbsolute,
                    request = turtlesim.srv.TeleportAbsoluteRequest(5.0,1.0,0.0)))

#        StateMachine.add('MONITOR',
#                  MonitorState('/go', String,
#                     cond_cb = find_red),
#                      {'valid':'MONITOR','invalid':'TELEPORT1'})


##################### TURTLESIM TEST SETUP ##################################
        # Reset turtlesim
#        StateMachine.add('RESET',
#                ServiceState('reset', std_srvs.srv.Empty),
#                {'succeeded':'SPAWN'})

        # Create a second turtle
#        StateMachine.add('SPAWN',
#                ServiceState('spawn', turtlesim.srv.Spawn,
#                    request = turtlesim.srv.SpawnRequest(0.0,0.0,0.0,'turtle2')),
#                {'succeeded':'TELEPORT1'})

        # Teleport turtle 1
#        StateMachine.add('TELEPORT1',
#                ServiceState('turtle1/teleport_absolute', turtlesim.srv.TeleportAbsolute,
#                    request = turtlesim.srv.TeleportAbsoluteRequest(5.0,1.0,0.0)),
#                {'succeeded':'DRAW_SHAPES'})

        # Draw some polygons
#        shapes_cc = Concurrence(
#                outcomes=['succeeded','aborted','preempted'],
#                default_outcome='aborted',
#                outcome_map = {'succeeded':{'BIG':'succeeded','SMALL':'succeeded'}})
#        StateMachine.add('DRAW_SHAPES',shapes_cc)
#        with shapes_cc:
#            # Draw a large polygon with the first turtle
#            Concurrence.add('BIG',
#                    SimpleActionState('turtle_shape1',turtle_actionlib.msg.ShapeAction,
#                        goal = polygon_big))

            # Draw a small polygon with the second turtle
#            small_shape_sm = StateMachine(outcomes=['succeeded','aborted','preempted'])
#            Concurrence.add('SMALL',small_shape_sm)
#            with small_shape_sm:
                # Teleport turtle 2
#                StateMachine.add('TELEPORT2',
#                        ServiceState('turtle2/teleport_absolute', turtlesim.srv.TeleportAbsolute,
#                            request = turtlesim.srv.TeleportAbsoluteRequest(9.0,5.0,0.0)),
#                        {'succeeded':'DRAW_WITH_MONITOR'})

                # Construct a concurrence for the shape action and the monitor
#                draw_monitor_cc = Concurrence(
#                        ['succeeded','aborted','preempted','interrupted'],
#                        'aborted',
#                        child_termination_cb = lambda so: True,
#                        outcome_map = {
#                            'succeeded':{'DRAW':'succeeded'},
#                            'preempted':{'DRAW':'preempted','MONITOR':'preempted'},
#                            'interrupted':{'MONITOR':'invalid'}})

#                StateMachine.add('DRAW_WITH_MONITOR',
#                        draw_monitor_cc,
#                        {'interrupted':'WAIT_FOR_CLEAR'})

#                with draw_monitor_cc:
#                    Concurrence.add('DRAW',
#                            SimpleActionState('turtle_shape2',turtle_actionlib.msg.ShapeAction,
#                                goal = polygon_small))
#                    def turtle_far_away(ud, msg):
#                        """Returns True while turtle pose in msg is at least 1 unit away from (9,5)"""
#                        if sqrt(pow(msg.x-9.0,2) + pow(msg.y-5.0,2)) > 2.0:
#                            return True
#                        return False
#                    Concurrence.add('MONITOR',
#                            MonitorState('/turtle1/pose',turtlesim.msg.Pose,
#                                cond_cb = turtle_far_away))

#                StateMachine.add('WAIT_FOR_CLEAR',
#                        MonitorState('/turtle1/pose',turtlesim.msg.Pose,
#                            cond_cb = lambda ud,msg: not turtle_far_away(ud,msg)),
#                        {'valid':'WAIT_FOR_CLEAR','invalid':'TELEPORT2'})


    # Attach a SMACH introspection server
    sis = IntrospectionServer('smach_usecase_01', sm0, '/USE_CASE')
    sis.start()

    # Set preempt handler
    smach_ros.set_preempt_handler(sm0)

    # Execute SMACH tree in a separate thread so that we can ctrl-c the script
    #smach_thread = threading.Thread(target = sm0.execute)
    #smach_thread.start()
##################################
# Construct action server wrapper
    asw = ActionServerWrapper(
           'my_action_server_name', MachineAction,
           wrapped_container = sm0,
           succeeded_outcomes = ['did_something','did_something_else'],
           aborted_outcomes = ['aborted'],
           preempted_outcomes = ['preempted'] )

    # Run the server in a background thread
    asw.run_server()
    # Signal handler


if __name__ == '__main__':
  rospy.init_node('server_machine')
  global forward
  global rotation
  global twist_vel
  twist_vel = Twist()
  global xR, yR, wR, hR
  #global xR
  global l_b1 
  global u_b1
  global l_b2 
  global u_b2
  global kernel
  global twist_pub
  #RED
  l_b1 = np.array([40, 180, 40])
  u_b1= np.array([80, 255, 255])
  l_b2 = np.array([0, 10, 80])
  u_b2= np.array([10, 255, 255])
  #l_b1 = np.array([0, 0, 0])
  #u_b1= np.array([0, 255, 0])
  #l_b2 = np.array([170, 10, 80])
  #u_b2= np.array([180, 255, 255])
  kernel = np.ones((3,3), np.uint8) #Matrix used for opening 
  xR=1
  velocity=0
  #image_converter()
  #print (xR)
  #polygonial(xR)

  twist_pub = rospy.Publisher("robot_base_velocity_controller/cmd_vel", Twist, queue_size=1000);



  t1 = threading.Thread(target=polygonial)
  t2 = threading.Thread(target=image_converter)
  t1.start()
  t2.start()
  ##########################################
  #rate = rospy.Rate(10) # 10hz
  #try:
  #  rospy.spin()
  #except KeyboardInterrupt:
  #  print("Shutting down")
