; Auto-generated. Do not edit!


(cl:in-package actionlib_tutorials-msg)


;//! \htmlinclude my_newResult.msg.html

(cl:defclass <my_newResult> (roslisp-msg-protocol:ros-message)
  ((time_elapsed
    :reader time_elapsed
    :initarg :time_elapsed
    :type cl:real
    :initform 0)
   (updates_n
    :reader updates_n
    :initarg :updates_n
    :type cl:integer
    :initform 0))
)

(cl:defclass my_newResult (<my_newResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <my_newResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'my_newResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name actionlib_tutorials-msg:<my_newResult> is deprecated: use actionlib_tutorials-msg:my_newResult instead.")))

(cl:ensure-generic-function 'time_elapsed-val :lambda-list '(m))
(cl:defmethod time_elapsed-val ((m <my_newResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actionlib_tutorials-msg:time_elapsed-val is deprecated.  Use actionlib_tutorials-msg:time_elapsed instead.")
  (time_elapsed m))

(cl:ensure-generic-function 'updates_n-val :lambda-list '(m))
(cl:defmethod updates_n-val ((m <my_newResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actionlib_tutorials-msg:updates_n-val is deprecated.  Use actionlib_tutorials-msg:updates_n instead.")
  (updates_n m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <my_newResult>) ostream)
  "Serializes a message object of type '<my_newResult>"
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'updates_n)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'updates_n)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'updates_n)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'updates_n)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <my_newResult>) istream)
  "Deserializes a message object of type '<my_newResult>"
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
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'updates_n)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'updates_n)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'updates_n)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'updates_n)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<my_newResult>)))
  "Returns string type for a message object of type '<my_newResult>"
  "actionlib_tutorials/my_newResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'my_newResult)))
  "Returns string type for a message object of type 'my_newResult"
  "actionlib_tutorials/my_newResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<my_newResult>)))
  "Returns md5sum for a message object of type '<my_newResult>"
  "ec7b9dd60f0cbf3a48147f1dd0e2c305")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'my_newResult)))
  "Returns md5sum for a message object of type 'my_newResult"
  "ec7b9dd60f0cbf3a48147f1dd0e2c305")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<my_newResult>)))
  "Returns full string definition for message of type '<my_newResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Part 2: the result, sent by action server unpon completion~%#~%# How much time used~%duration time_elapsed~%# How many updates thrown in total~%uint32 updates_n~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'my_newResult)))
  "Returns full string definition for message of type 'my_newResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Part 2: the result, sent by action server unpon completion~%#~%# How much time used~%duration time_elapsed~%# How many updates thrown in total~%uint32 updates_n~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <my_newResult>))
  (cl:+ 0
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <my_newResult>))
  "Converts a ROS message object to a list"
  (cl:list 'my_newResult
    (cl:cons ':time_elapsed (time_elapsed msg))
    (cl:cons ':updates_n (updates_n msg))
))