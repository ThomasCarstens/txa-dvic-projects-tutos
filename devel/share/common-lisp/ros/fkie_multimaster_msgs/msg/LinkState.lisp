; Auto-generated. Do not edit!


(cl:in-package fkie_multimaster_msgs-msg)


;//! \htmlinclude LinkState.msg.html

(cl:defclass <LinkState> (roslisp-msg-protocol:ros-message)
  ((destination
    :reader destination
    :initarg :destination
    :type cl:string
    :initform "")
   (quality
    :reader quality
    :initarg :quality
    :type cl:float
    :initform 0.0)
   (last_heartbeat
    :reader last_heartbeat
    :initarg :last_heartbeat
    :type cl:real
    :initform 0))
)

(cl:defclass LinkState (<LinkState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LinkState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LinkState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name fkie_multimaster_msgs-msg:<LinkState> is deprecated: use fkie_multimaster_msgs-msg:LinkState instead.")))

(cl:ensure-generic-function 'destination-val :lambda-list '(m))
(cl:defmethod destination-val ((m <LinkState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fkie_multimaster_msgs-msg:destination-val is deprecated.  Use fkie_multimaster_msgs-msg:destination instead.")
  (destination m))

(cl:ensure-generic-function 'quality-val :lambda-list '(m))
(cl:defmethod quality-val ((m <LinkState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fkie_multimaster_msgs-msg:quality-val is deprecated.  Use fkie_multimaster_msgs-msg:quality instead.")
  (quality m))

(cl:ensure-generic-function 'last_heartbeat-val :lambda-list '(m))
(cl:defmethod last_heartbeat-val ((m <LinkState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fkie_multimaster_msgs-msg:last_heartbeat-val is deprecated.  Use fkie_multimaster_msgs-msg:last_heartbeat instead.")
  (last_heartbeat m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LinkState>) ostream)
  "Serializes a message object of type '<LinkState>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'destination))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'destination))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'quality))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'last_heartbeat)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'last_heartbeat) (cl:floor (cl:slot-value msg 'last_heartbeat)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LinkState>) istream)
  "Deserializes a message object of type '<LinkState>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'destination) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'destination) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'quality) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'last_heartbeat) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LinkState>)))
  "Returns string type for a message object of type '<LinkState>"
  "fkie_multimaster_msgs/LinkState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LinkState)))
  "Returns string type for a message object of type 'LinkState"
  "fkie_multimaster_msgs/LinkState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LinkState>)))
  "Returns md5sum for a message object of type '<LinkState>"
  "fd2554dabc9a5d69f4842dd42dd3e0f3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LinkState)))
  "Returns md5sum for a message object of type 'LinkState"
  "fd2554dabc9a5d69f4842dd42dd3e0f3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LinkState>)))
  "Returns full string definition for message of type '<LinkState>"
  (cl:format cl:nil "string destination~%float32 quality~%# The timestamp of the last received heartbeat message~%time last_heartbeat~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LinkState)))
  "Returns full string definition for message of type 'LinkState"
  (cl:format cl:nil "string destination~%float32 quality~%# The timestamp of the last received heartbeat message~%time last_heartbeat~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LinkState>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'destination))
     4
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LinkState>))
  "Converts a ROS message object to a list"
  (cl:list 'LinkState
    (cl:cons ':destination (destination msg))
    (cl:cons ':quality (quality msg))
    (cl:cons ':last_heartbeat (last_heartbeat msg))
))
