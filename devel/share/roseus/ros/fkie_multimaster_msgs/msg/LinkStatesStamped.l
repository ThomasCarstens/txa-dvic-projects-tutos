;; Auto-generated. Do not edit!


(when (boundp 'fkie_multimaster_msgs::LinkStatesStamped)
  (if (not (find-package "FKIE_MULTIMASTER_MSGS"))
    (make-package "FKIE_MULTIMASTER_MSGS"))
  (shadow 'LinkStatesStamped (find-package "FKIE_MULTIMASTER_MSGS")))
(unless (find-package "FKIE_MULTIMASTER_MSGS::LINKSTATESSTAMPED")
  (make-package "FKIE_MULTIMASTER_MSGS::LINKSTATESSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude LinkStatesStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass fkie_multimaster_msgs::LinkStatesStamped
  :super ros::object
  :slots (_header _links ))

(defmethod fkie_multimaster_msgs::LinkStatesStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:links __links) (let (r) (dotimes (i 0) (push (instance fkie_multimaster_msgs::LinkState :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _links __links)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:links
   (&rest __links)
   (if (keywordp (car __links))
       (send* _links __links)
     (progn
       (if __links (setq _links (car __links)))
       _links)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; fkie_multimaster_msgs/LinkState[] _links
    (apply #'+ (send-all _links :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; fkie_multimaster_msgs/LinkState[] _links
     (write-long (length _links) s)
     (dolist (elem _links)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; fkie_multimaster_msgs/LinkState[] _links
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _links (let (r) (dotimes (i n) (push (instance fkie_multimaster_msgs::LinkState :init) r)) r))
     (dolist (elem- _links)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get fkie_multimaster_msgs::LinkStatesStamped :md5sum-) "36d101076ab31009020bc3d52fdd6264")
(setf (get fkie_multimaster_msgs::LinkStatesStamped :datatype-) "fkie_multimaster_msgs/LinkStatesStamped")
(setf (get fkie_multimaster_msgs::LinkStatesStamped :definition-)
      "Header header
fkie_multimaster_msgs/LinkState[] links
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: fkie_multimaster_msgs/LinkState
string destination
float32 quality
# The timestamp of the last received heartbeat message
time last_heartbeat

")



(provide :fkie_multimaster_msgs/LinkStatesStamped "36d101076ab31009020bc3d52fdd6264")


