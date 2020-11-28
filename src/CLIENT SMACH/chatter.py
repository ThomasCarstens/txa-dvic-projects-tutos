#!/usr/bin/env python

import rospy
from std_msgs.msg import String
import random
def put_on_default():
    pub = rospy.Publisher('/cf2/pattern', String, queue_size = 100)
    rospy.init_node('test_button')
    rospy.loginfo("Default on wait until pressed")
    text = raw_input()
    #print(text)

    while not rospy.is_shutdown():
        pub.publish("home")
        #rospy.sleep(0.05)

if __name__ == '__main__':
 # try:
  put_on_default()
 # except Exception, e:
 #   print "done"
