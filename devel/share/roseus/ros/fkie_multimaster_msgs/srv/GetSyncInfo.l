;; Auto-generated. Do not edit!


(when (boundp 'fkie_multimaster_msgs::GetSyncInfo)
  (if (not (find-package "FKIE_MULTIMASTER_MSGS"))
    (make-package "FKIE_MULTIMASTER_MSGS"))
  (shadow 'GetSyncInfo (find-package "FKIE_MULTIMASTER_MSGS")))
(unless (find-package "FKIE_MULTIMASTER_MSGS::GETSYNCINFO")
  (make-package "FKIE_MULTIMASTER_MSGS::GETSYNCINFO"))
(unless (find-package "FKIE_MULTIMASTER_MSGS::GETSYNCINFOREQUEST")
  (make-package "FKIE_MULTIMASTER_MSGS::GETSYNCINFOREQUEST"))
(unless (find-package "FKIE_MULTIMASTER_MSGS::GETSYNCINFORESPONSE")
  (make-package "FKIE_MULTIMASTER_MSGS::GETSYNCINFORESPONSE"))

(in-package "ROS")





(defclass fkie_multimaster_msgs::GetSyncInfoRequest
  :super ros::object
  :slots ())

(defmethod fkie_multimaster_msgs::GetSyncInfoRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass fkie_multimaster_msgs::GetSyncInfoResponse
  :super ros::object
  :slots (_hosts ))

(defmethod fkie_multimaster_msgs::GetSyncInfoResponse
  (:init
   (&key
    ((:hosts __hosts) (let (r) (dotimes (i 0) (push (instance fkie_multimaster_msgs::SyncMasterInfo :init) r)) r))
    )
   (send-super :init)
   (setq _hosts __hosts)
   self)
  (:hosts
   (&rest __hosts)
   (if (keywordp (car __hosts))
       (send* _hosts __hosts)
     (progn
       (if __hosts (setq _hosts (car __hosts)))
       _hosts)))
  (:serialization-length
   ()
   (+
    ;; fkie_multimaster_msgs/SyncMasterInfo[] _hosts
    (apply #'+ (send-all _hosts :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; fkie_multimaster_msgs/SyncMasterInfo[] _hosts
     (write-long (length _hosts) s)
     (dolist (elem _hosts)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; fkie_multimaster_msgs/SyncMasterInfo[] _hosts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _hosts (let (r) (dotimes (i n) (push (instance fkie_multimaster_msgs::SyncMasterInfo :init) r)) r))
     (dolist (elem- _hosts)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass fkie_multimaster_msgs::GetSyncInfo
  :super ros::object
  :slots ())

(setf (get fkie_multimaster_msgs::GetSyncInfo :md5sum-) "d5261ec56e202860a07fb47b41e1b2a8")
(setf (get fkie_multimaster_msgs::GetSyncInfo :datatype-) "fkie_multimaster_msgs/GetSyncInfo")
(setf (get fkie_multimaster_msgs::GetSyncInfo :request) fkie_multimaster_msgs::GetSyncInfoRequest)
(setf (get fkie_multimaster_msgs::GetSyncInfo :response) fkie_multimaster_msgs::GetSyncInfoResponse)

(defmethod fkie_multimaster_msgs::GetSyncInfoRequest
  (:response () (instance fkie_multimaster_msgs::GetSyncInfoResponse :init)))

(setf (get fkie_multimaster_msgs::GetSyncInfoRequest :md5sum-) "d5261ec56e202860a07fb47b41e1b2a8")
(setf (get fkie_multimaster_msgs::GetSyncInfoRequest :datatype-) "fkie_multimaster_msgs/GetSyncInfoRequest")
(setf (get fkie_multimaster_msgs::GetSyncInfoRequest :definition-)
      "---
fkie_multimaster_msgs/SyncMasterInfo[] hosts

================================================================================
MSG: fkie_multimaster_msgs/SyncMasterInfo
string masteruri
string[] nodes
fkie_multimaster_msgs/SyncTopicInfo[] publisher
fkie_multimaster_msgs/SyncTopicInfo[] subscriber
fkie_multimaster_msgs/SyncServiceInfo[] services
================================================================================
MSG: fkie_multimaster_msgs/SyncTopicInfo
string topic
string node
string nodeuri
================================================================================
MSG: fkie_multimaster_msgs/SyncServiceInfo
string service
string serviceuri
string node
")

(setf (get fkie_multimaster_msgs::GetSyncInfoResponse :md5sum-) "d5261ec56e202860a07fb47b41e1b2a8")
(setf (get fkie_multimaster_msgs::GetSyncInfoResponse :datatype-) "fkie_multimaster_msgs/GetSyncInfoResponse")
(setf (get fkie_multimaster_msgs::GetSyncInfoResponse :definition-)
      "---
fkie_multimaster_msgs/SyncMasterInfo[] hosts

================================================================================
MSG: fkie_multimaster_msgs/SyncMasterInfo
string masteruri
string[] nodes
fkie_multimaster_msgs/SyncTopicInfo[] publisher
fkie_multimaster_msgs/SyncTopicInfo[] subscriber
fkie_multimaster_msgs/SyncServiceInfo[] services
================================================================================
MSG: fkie_multimaster_msgs/SyncTopicInfo
string topic
string node
string nodeuri
================================================================================
MSG: fkie_multimaster_msgs/SyncServiceInfo
string service
string serviceuri
string node
")



(provide :fkie_multimaster_msgs/GetSyncInfo "d5261ec56e202860a07fb47b41e1b2a8")


