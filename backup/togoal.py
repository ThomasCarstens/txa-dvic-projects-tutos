#!/usr/bin/env python
#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from turtlesim.msg import Pose
from math import pow, atan2, sqrt



class TurtleBot:

    def __init__(self):
        # Creates a node with name 'turtlebot_controller' and make sure it is a
        # unique node (using anonymous=True).
        rospy.init_node('turtlebot_controller', anonymous=True)

        # Publisher which will publish to the topic '/turtle1/cmd_vel'.
        self.velocity_publisher = rospy.Publisher('/turtle1/cmd_vel',
                                                  Twist, queue_size=10)

        # A subscriber to the topic '/turtle1/pose'. self.update_pose is called
        # when a message of type Pose is received.
        self.pose_subscriber = rospy.Subscriber('/turtle1/pose',
                                                Pose, self.update_pose1)
        self.pose_subscriber = rospy.Subscriber('/turtle2/pose',
                                                Pose, self.update_pose2)
        self.turtle1_pose = Pose()
        self.turtle2_pose = Pose()
        self.rate = rospy.Rate(10)

    def update_pose1(self, data):
        """Callback function which is called when a new message of type Pose is
        received by the subscriber."""
        self.turtle1_pose = data
        self.turtle1_pose.x = round(self.turtle1_pose.x, 4)
        self.turtle1_pose.y = round(self.turtle1_pose.y, 4)
	#print("turtle1:")

    def update_pose2(self, data):
        """Callback function which is called when a new message of type Pose is
        received by the subscriber."""
        self.turtle2_pose = data
        self.turtle2_pose.x = round(self.turtle2_pose.x, 4)
        self.turtle2_pose.y = round(self.turtle2_pose.y, 4)
	#print("turtle2:")

    def euclidean_distance(self, goal_pose):
        """Euclidean distance between current pose and the goal."""
        euclidean_distance= sqrt(pow((goal_pose.x - self.turtle1_pose.x), 2) + pow((goal_pose.y - self.turtle1_pose.y), 2))
	print("distance is", euclidean_distance)
	return euclidean_distance
	

    def linear_vel(self, goal_pose, constant=1.5):
        """See video: https://www.youtube.com/watch?v=Qh15Nol5htM."""
        return constant * self.euclidean_distance(goal_pose)

    def steering_angle(self, goal_pose):
        """See video: https://www.youtube.com/watch?v=Qh15Nol5htM."""
        return atan2(goal_pose.y - self.turtle1_pose.y, goal_pose.x - self.turtle1_pose.x)

    def angular_vel(self, goal_pose, constant=6):
        """See video: https://www.youtube.com/watch?v=Qh15Nol5htM."""
        return constant * (self.steering_angle(goal_pose) - self.turtle1_pose.theta)

    def move2goal(self):
        """Moves the turtle to the goal."""
        goal_pose = Pose()

        # Get the input from the user.
        #goal_pose.x = input("Set your x goal: ")
        #goal_pose.y = input("Set your y goal: ")


        # Please, insert a number slightly greater than 0 (e.g. 0.01).
        distance_tolerance = input("Set your tolerance: ")

        goal_pose.x = self.turtle2_pose.x
        goal_pose.y = self.turtle2_pose.y
	print ("goal pose is", goal_pose.x, goal_pose.y)
	print ("turtle2:", self.turtle2_pose.x, self.turtle2_pose.y)

        vel_msg = Twist()

        while self.euclidean_distance(goal_pose) >= distance_tolerance:

            # Porportional controller.
            # https://en.wikipedia.org/wiki/Proportional_control

            # Linear velocity in the x-axis.
            vel_msg.linear.x = self.linear_vel(goal_pose)
            vel_msg.linear.y = 0
            vel_msg.linear.z = 0

            # Angular velocity in the z-axis.
            vel_msg.angular.x = 0
            vel_msg.angular.y = 0
            vel_msg.angular.z = self.angular_vel(goal_pose)

            # Publishing our vel_msg
            self.velocity_publisher.publish(vel_msg)

            # Publish at the desired rate.
            self.rate.sleep()
	print ("goal pose is", goal_pose.x, goal_pose.y)

        # Stopping our robot after the movement is over.
	print ("turtle1:", self.turtle1_pose.x, self.turtle1_pose.y)
	print ("turtle2:", self.turtle2_pose.x, self.turtle2_pose.y)
        vel_msg.linear.x = 0
        vel_msg.angular.z = 0
        self.velocity_publisher.publish(vel_msg)

        # If we press control + C, the node will stop.
        rospy.spin()

if __name__ == '__main__':
    try:
        x = TurtleBot()
        x.move2goal()
    except rospy.ROSInterruptException:
        pass
