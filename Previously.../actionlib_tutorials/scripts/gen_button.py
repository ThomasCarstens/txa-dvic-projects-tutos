#!/usr/bin/env python

import rospy
from std_msgs.msg import String
import random
def put_on_default():
    pub = rospy.Publisher('go', String)
    rospy.init_node('test_button', log_level=rospy.INFO)
    rospy.loginfo("Default on wait until pressed")
    pub.publish("wait")
    while not rospy.is_shutdown():
        
        rospy.sleep(0.05)

if __name__ == '__main__':
  try:
    put_on_default()
  except Exception, e:
    print "done"
