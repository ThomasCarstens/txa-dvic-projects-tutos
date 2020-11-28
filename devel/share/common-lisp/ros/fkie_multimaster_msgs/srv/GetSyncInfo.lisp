; Auto-generated. Do not edit!


(cl:in-package fkie_multimaster_msgs-srv)


;//! \htmlinclude GetSyncInfo-request.msg.html

(cl:defclass <GetSyncInfo-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetSyncInfo-request (<GetSyncInfo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetSyncInfo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetSyncInfo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name fkie_multimaster_msgs-srv:<GetSyncInfo-request> is deprecated: use fkie_multimaster_msgs-srv:GetSyncInfo-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetSyncInfo-request>) ostream)
  "Serializes a message object of type '<GetSyncInfo-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetSyncInfo-request>) istream)
  "Deserializes a message object of type '<GetSyncInfo-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetSyncInfo-request>)))
  "Returns string type for a service object of type '<GetSyncInfo-request>"
  "fkie_multimaster_msgs/GetSyncInfoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSyncInfo-request)))
  "Returns string type for a service object of type 'GetSyncInfo-request"
  "fkie_multimaster_msgs/GetSyncInfoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetSyncInfo-request>)))
  "Returns md5sum for a message object of type '<GetSyncInfo-request>"
  "d5261ec56e202860a07fb47b41e1b2a8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetSyncInfo-request)))
  "Returns md5sum for a message object of type 'GetSyncInfo-request"
  "d5261ec56e202860a07fb47b41e1b2a8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetSyncInfo-request>)))
  "Returns full string definition for message of type '<GetSyncInfo-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetSyncInfo-request)))
  "Returns full string definition for message of type 'GetSyncInfo-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetSyncInfo-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetSyncInfo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetSyncInfo-request
))
;//! \htmlinclude GetSyncInfo-response.msg.html

(cl:defclass <GetSyncInfo-response> (roslisp-msg-protocol:ros-message)
  ((hosts
    :reader hosts
    :initarg :hosts
    :type (cl:vector fkie_multimaster_msgs-msg:SyncMasterInfo)
   :initform (cl:make-array 0 :element-type 'fkie_multimaster_msgs-msg:SyncMasterInfo :initial-element (cl:make-instance 'fkie_multimaster_msgs-msg:SyncMasterInfo))))
)

(cl:defclass GetSyncInfo-response (<GetSyncInfo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetSyncInfo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetSyncInfo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name fkie_multimaster_msgs-srv:<GetSyncInfo-response> is deprecated: use fkie_multimaster_msgs-srv:GetSyncInfo-response instead.")))

(cl:ensure-generic-function 'hosts-val :lambda-list '(m))
(cl:defmethod hosts-val ((m <GetSyncInfo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fkie_multimaster_msgs-srv:hosts-val is deprecated.  Use fkie_multimaster_msgs-srv:hosts instead.")
  (hosts m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetSyncInfo-response>) ostream)
  "Serializes a message object of type '<GetSyncInfo-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'hosts))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'hosts))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetSyncInfo-response>) istream)
  "Deserializes a message object of type '<GetSyncInfo-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'hosts) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'hosts)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'fkie_multimaster_msgs-msg:SyncMasterInfo))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetSyncInfo-response>)))
  "Returns string type for a service object of type '<GetSyncInfo-response>"
  "fkie_multimaster_msgs/GetSyncInfoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSyncInfo-response)))
  "Returns string type for a service object of type 'GetSyncInfo-response"
  "fkie_multimaster_msgs/GetSyncInfoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetSyncInfo-response>)))
  "Returns md5sum for a message object of type '<GetSyncInfo-response>"
  "d5261ec56e202860a07fb47b41e1b2a8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetSyncInfo-response)))
  "Returns md5sum for a message object of type 'GetSyncInfo-response"
  "d5261ec56e202860a07fb47b41e1b2a8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetSyncInfo-response>)))
  "Returns full string definition for message of type '<GetSyncInfo-response>"
  (cl:format cl:nil "fkie_multimaster_msgs/SyncMasterInfo[] hosts~%~%================================================================================~%MSG: fkie_multimaster_msgs/SyncMasterInfo~%string masteruri~%string[] nodes~%fkie_multimaster_msgs/SyncTopicInfo[] publisher~%fkie_multimaster_msgs/SyncTopicInfo[] subscriber~%fkie_multimaster_msgs/SyncServiceInfo[] services~%================================================================================~%MSG: fkie_multimaster_msgs/SyncTopicInfo~%string topic~%string node~%string nodeuri~%================================================================================~%MSG: fkie_multimaster_msgs/SyncServiceInfo~%string service~%string serviceuri~%string node~%string nodeuri~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetSyncInfo-response)))
  "Returns full string definition for message of type 'GetSyncInfo-response"
  (cl:format cl:nil "fkie_multimaster_msgs/SyncMasterInfo[] hosts~%~%================================================================================~%MSG: fkie_multimaster_msgs/SyncMasterInfo~%string masteruri~%string[] nodes~%fkie_multimaster_msgs/SyncTopicInfo[] publisher~%fkie_multimaster_msgs/SyncTopicInfo[] subscriber~%fkie_multimaster_msgs/SyncServiceInfo[] services~%================================================================================~%MSG: fkie_multimaster_msgs/SyncTopicInfo~%string topic~%string node~%string nodeuri~%================================================================================~%MSG: fkie_multimaster_msgs/SyncServiceInfo~%string service~%string serviceuri~%string node~%string nodeuri~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetSyncInfo-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'hosts) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetSyncInfo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetSyncInfo-response
    (cl:cons ':hosts (hosts msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetSyncInfo)))
  'GetSyncInfo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetSyncInfo)))
  'GetSyncInfo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSyncInfo)))
  "Returns string type for a service object of type '<GetSyncInfo>"
  "fkie_multimaster_msgs/GetSyncInfo")