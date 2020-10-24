#!/usr/bin/env python
from __future__ import print_function

import roslib
#roslib.load_manifest('my_package')
import sys
import rospy
import numpy as np
import cv2
from std_msgs.msg import String
from geometry_msgs.msg import Twist
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

#Can be used to open new windows during execution.
	#cv2.drawContours(frame, contours, -1, (0,255,0), 2)#dessiner contours
        #cv2.imshow("frame", cv_image)
        #cv2.imshow("greenmask", greenmask)
        #cv2.imshow("redmask", redmask)
        #cv2.imshow("opening", opening_masked_img)
        #cv2.imshow("masked_img", G_masked_img)
        #cv2.imshow("Image window", cv_image)
        #cv2.waitKey(1)



class image_converter:

  def __init__(self):
# Initialise publishers and subscribers:

    self.image_pub = # Publisher for an image (optional, for a target/text/etc overlay)
    self.twist_pub = # Publishing a robot velocity
    self.gate_pub= # Publishing a string as information (eg. "found" or "searching", your plan)
    self.bridge = CvBridge() #Leave as such: ROS<->OpenCV
    self.image_sub = # Subscriber to raw image 


    
    



#####################     CALLBACK OF CAMERA IMAGE  ###########################################
  def callback(self,data):
    

########################   GATE_STATE ###########################################
#lay out your plan here.


    ############### TEMPLATE FOR DETECTING THE RED COLOUR #############################
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

    ###################### PUTTING INFO ON THE CAMERA PICTURE #########################
    cv2.line(cv_image,(400,480),(x2,y2),(0,255,0),1)
    font = cv2.FONT_HERSHEY_COMPLEX
    if -velocity<0 : #adding text overlay!
    text = 'Gauche'
    else :
    text = 'Droite'
    cv2.putText(cv_image, text, (20, 20), font, 1, (0, 255, 0), 1, cv2.LINE_4)
    cv2.rectangle(cv_image, (x, y), (x + w, y + h), (0, 255, 0), 2)
		
    cv2.drawContours(frame, contours, -1, (0,255,0), 2)#dessiner contours
   
#################################### OBSTACLE EXISTENCE ###############################
    cv2.imshow("Green_maskimg", G_masked_img)
    cv2.waitKey(1)
 

def main(args):
  rospy.init_node('image_converter', anonymous=True)
  global l_b1 
  global u_b1
  global l_b2 
  global u_b2
  global kernel
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
  ic = image_converter() #used by cvbridge!
  
  #Initialise your velocity variables!

  #Initialise any other nodes that might be useful.
  
  rate = rospy.Rate(10) # 10hz
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
