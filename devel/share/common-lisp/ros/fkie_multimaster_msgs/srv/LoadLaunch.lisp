; Auto-generated. Do not edit!


(cl:in-package fkie_multimaster_msgs-srv)


;//! \htmlinclude LoadLaunch-request.msg.html

(cl:defclass <LoadLaunch-request> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type cl:string
    :initform ""))
)

(cl:defclass LoadLaunch-request (<LoadLaunch-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadLaunch-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadLaunch-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name fkie_multimaster_msgs-srv:<LoadLaunch-request> is deprecated: use fkie_multimaster_msgs-srv:LoadLaunch-request instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <LoadLaunch-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fkie_multimaster_msgs-srv:path-val is deprecated.  Use fkie_multimaster_msgs-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadLaunch-request>) ostream)
  "Serializes a message object of type '<LoadLaunch-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'path))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadLaunch-request>) istream)
  "Deserializes a message object of type '<LoadLaunch-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'path) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'path) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadLaunch-request>)))
  "Returns string type for a service object of type '<LoadLaunch-request>"
  "fkie_multimaster_msgs/LoadLaunchRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadLaunch-request)))
  "Returns string type for a service object of type 'LoadLaunch-request"
  "fkie_multimaster_msgs/LoadLaunchRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadLaunch-request>)))
  "Returns md5sum for a message object of type '<LoadLaunch-request>"
  "1d00cd540af97efeb6b1589112fab63e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadLaunch-request)))
  "Returns md5sum for a message object of type 'LoadLaunch-request"
  "1d00cd540af97efeb6b1589112fab63e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadLaunch-request>)))
  "Returns full string definition for message of type '<LoadLaunch-request>"
  (cl:format cl:nil "string path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadLaunch-request)))
  "Returns full string definition for message of type 'LoadLaunch-request"
  (cl:format cl:nil "string path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadLaunch-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadLaunch-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadLaunch-request
    (cl:cons ':path (path msg))
))
;//! \htmlinclude LoadLaunch-response.msg.html

(cl:defclass <LoadLaunch-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass LoadLaunch-response (<LoadLaunch-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadLaunch-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadLaunch-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name fkie_multimaster_msgs-srv:<LoadLaunch-response> is deprecated: use fkie_multimaster_msgs-srv:LoadLaunch-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadLaunch-response>) ostream)
  "Serializes a message object of type '<LoadLaunch-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadLaunch-response>) istream)
  "Deserializes a message object of type '<LoadLaunch-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadLaunch-response>)))
  "Returns string type for a service object of type '<LoadLaunch-response>"
  "fkie_multimaster_msgs/LoadLaunchResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadLaunch-response)))
  "Returns string type for a service object of type 'LoadLaunch-response"
  "fkie_multimaster_msgs/LoadLaunchResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadLaunch-response>)))
  "Returns md5sum for a message object of type '<LoadLaunch-response>"
  "1d00cd540af97efeb6b1589112fab63e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadLaunch-response)))
  "Returns md5sum for a message object of type 'LoadLaunch-response"
  "1d00cd540af97efeb6b1589112fab63e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadLaunch-response>)))
  "Returns full string definition for message of type '<LoadLaunch-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadLaunch-response)))
  "Returns full string definition for message of type 'LoadLaunch-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadLaunch-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadLaunch-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadLaunch-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LoadLaunch)))
  'LoadLaunch-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LoadLaunch)))
  'LoadLaunch-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadLaunch)))
  "Returns string type for a service object of type '<LoadLaunch>"
  "fkie_multimaster_msgs/LoadLaunch")