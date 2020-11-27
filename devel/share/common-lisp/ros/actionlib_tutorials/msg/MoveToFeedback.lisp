; Auto-generated. Do not edit!


(cl:in-package actionlib_tutorials-msg)


;//! \htmlinclude MoveToFeedback.msg.html

(cl:defclass <MoveToFeedback> (roslisp-msg-protocol:ros-message)
  ((time_elapsed
    :reader time_elapsed
    :initarg :time_elapsed
    :type cl:real
    :initform 0)
   (position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass MoveToFeedback (<MoveToFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveToFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveToFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name actionlib_tutorials-msg:<MoveToFeedback> is deprecated: use actionlib_tutorials-msg:MoveToFeedback instead.")))

(cl:ensure-generic-function 'time_elapsed-val :lambda-list '(m))
(cl:defmethod time_elapsed-val ((m <MoveToFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actionlib_tutorials-msg:time_elapsed-val is deprecated.  Use actionlib_tutorials-msg:time_elapsed instead.")
  (time_elapsed m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <MoveToFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actionlib_tutorials-msg:position-val is deprecated.  Use actionlib_tutorials-msg:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveToFeedback>) ostream)
  "Serializes a message object of type '<MoveToFeedback>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'time_elapsed)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'time_elapsed) (cl:floor (cl:slot-value msg 'time_elapsed)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveToFeedback>) istream)
  "Deserializes a message object of type '<MoveToFeedback>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'time_elapsed) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveToFeedback>)))
  "Returns string type for a message object of type '<MoveToFeedback>"
  "actionlib_tutorials/MoveToFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToFeedback)))
  "Returns string type for a message object of type 'MoveToFeedback"
  "actionlib_tutorials/MoveToFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveToFeedback>)))
  "Returns md5sum for a message object of type '<MoveToFeedback>"
  "54c4c071a26b91ca48642da204d5e25e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveToFeedback)))
  "Returns md5sum for a message object of type 'MoveToFeedback"
  "54c4c071a26b91ca48642da204d5e25e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveToFeedback>)))
  "Returns full string definition for message of type '<MoveToFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Part 3: the feedback,to be sent periodically by server~%#~%# The amount of time elapsed from the start~%duration time_elapsed~%#Where the drone is~%geometry_msgs/Pose position~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveToFeedback)))
  "Returns full string definition for message of type 'MoveToFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Part 3: the feedback,to be sent periodically by server~%#~%# The amount of time elapsed from the start~%duration time_elapsed~%#Where the drone is~%geometry_msgs/Pose position~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveToFeedback>))
  (cl:+ 0
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveToFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveToFeedback
    (cl:cons ':time_elapsed (time_elapsed msg))
    (cl:cons ':position (position msg))
))
