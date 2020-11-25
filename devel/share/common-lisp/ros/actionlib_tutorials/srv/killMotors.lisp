; Auto-generated. Do not edit!


(cl:in-package actionlib_tutorials-srv)


;//! \htmlinclude killMotors-request.msg.html

(cl:defclass <killMotors-request> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0))
)

(cl:defclass killMotors-request (<killMotors-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <killMotors-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'killMotors-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name actionlib_tutorials-srv:<killMotors-request> is deprecated: use actionlib_tutorials-srv:killMotors-request instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <killMotors-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actionlib_tutorials-srv:id-val is deprecated.  Use actionlib_tutorials-srv:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <killMotors-request>) ostream)
  "Serializes a message object of type '<killMotors-request>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <killMotors-request>) istream)
  "Deserializes a message object of type '<killMotors-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<killMotors-request>)))
  "Returns string type for a service object of type '<killMotors-request>"
  "actionlib_tutorials/killMotorsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'killMotors-request)))
  "Returns string type for a service object of type 'killMotors-request"
  "actionlib_tutorials/killMotorsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<killMotors-request>)))
  "Returns md5sum for a message object of type '<killMotors-request>"
  "77c661ef85dbd8d8b9b8b41a8c29118f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'killMotors-request)))
  "Returns md5sum for a message object of type 'killMotors-request"
  "77c661ef85dbd8d8b9b8b41a8c29118f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<killMotors-request>)))
  "Returns full string definition for message of type '<killMotors-request>"
  (cl:format cl:nil "int64 id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'killMotors-request)))
  "Returns full string definition for message of type 'killMotors-request"
  (cl:format cl:nil "int64 id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <killMotors-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <killMotors-request>))
  "Converts a ROS message object to a list"
  (cl:list 'killMotors-request
    (cl:cons ':id (id msg))
))
;//! \htmlinclude killMotors-response.msg.html

(cl:defclass <killMotors-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass killMotors-response (<killMotors-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <killMotors-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'killMotors-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name actionlib_tutorials-srv:<killMotors-response> is deprecated: use actionlib_tutorials-srv:killMotors-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <killMotors-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actionlib_tutorials-srv:result-val is deprecated.  Use actionlib_tutorials-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <killMotors-response>) ostream)
  "Serializes a message object of type '<killMotors-response>"
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <killMotors-response>) istream)
  "Deserializes a message object of type '<killMotors-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<killMotors-response>)))
  "Returns string type for a service object of type '<killMotors-response>"
  "actionlib_tutorials/killMotorsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'killMotors-response)))
  "Returns string type for a service object of type 'killMotors-response"
  "actionlib_tutorials/killMotorsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<killMotors-response>)))
  "Returns md5sum for a message object of type '<killMotors-response>"
  "77c661ef85dbd8d8b9b8b41a8c29118f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'killMotors-response)))
  "Returns md5sum for a message object of type 'killMotors-response"
  "77c661ef85dbd8d8b9b8b41a8c29118f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<killMotors-response>)))
  "Returns full string definition for message of type '<killMotors-response>"
  (cl:format cl:nil "int64 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'killMotors-response)))
  "Returns full string definition for message of type 'killMotors-response"
  (cl:format cl:nil "int64 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <killMotors-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <killMotors-response>))
  "Converts a ROS message object to a list"
  (cl:list 'killMotors-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'killMotors)))
  'killMotors-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'killMotors)))
  'killMotors-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'killMotors)))
  "Returns string type for a service object of type '<killMotors>"
  "actionlib_tutorials/killMotors")