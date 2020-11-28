;; Auto-generated. Do not edit!


(when (boundp 'fkie_multimaster_msgs::DiscoverMasters)
  (if (not (find-package "FKIE_MULTIMASTER_MSGS"))
    (make-package "FKIE_MULTIMASTER_MSGS"))
  (shadow 'DiscoverMasters (find-package "FKIE_MULTIMASTER_MSGS")))
(unless (find-package "FKIE_MULTIMASTER_MSGS::DISCOVERMASTERS")
  (make-package "FKIE_MULTIMASTER_MSGS::DISCOVERMASTERS"))
(unless (find-package "FKIE_MULTIMASTER_MSGS::DISCOVERMASTERSREQUEST")
  (make-package "FKIE_MULTIMASTER_MSGS::DISCOVERMASTERSREQUEST"))
(unless (find-package "FKIE_MULTIMASTER_MSGS::DISCOVERMASTERSRESPONSE")
  (make-package "FKIE_MULTIMASTER_MSGS::DISCOVERMASTERSRESPONSE"))

(in-package "ROS")





(defclass fkie_multimaster_msgs::DiscoverMastersRequest
  :super ros::object
  :slots ())

(defmethod fkie_multimaster_msgs::DiscoverMastersRequest
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

(defclass fkie_multimaster_msgs::DiscoverMastersResponse
  :super ros::object
  :slots (_masters ))

(defmethod fkie_multimaster_msgs::DiscoverMastersResponse
  (:init
   (&key
    ((:masters __masters) (let (r) (dotimes (i 0) (push (instance fkie_multimaster_msgs::ROSMaster :init) r)) r))
    )
   (send-super :init)
   (setq _masters __masters)
   self)
  (:masters
   (&rest __masters)
   (if (keywordp (car __masters))
       (send* _masters __masters)
     (progn
       (if __masters (setq _masters (car __masters)))
       _masters)))
  (:serialization-length
   ()
   (+
    ;; fkie_multimaster_msgs/ROSMaster[] _masters
    (apply #'+ (send-all _masters :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; fkie_multimaster_msgs/ROSMaster[] _masters
     (write-long (length _masters) s)
     (dolist (elem _masters)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; fkie_multimaster_msgs/ROSMaster[] _masters
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _masters (let (r) (dotimes (i n) (push (instance fkie_multimaster_msgs::ROSMaster :init) r)) r))
     (dolist (elem- _masters)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass fkie_multimaster_msgs::DiscoverMasters
  :super ros::object
  :slots ())

(setf (get fkie_multimaster_msgs::DiscoverMasters :md5sum-) "31a962d97ea3e3c12d428ff4786f124b")
(setf (get fkie_multimaster_msgs::DiscoverMasters :datatype-) "fkie_multimaster_msgs/DiscoverMasters")
(setf (get fkie_multimaster_msgs::DiscoverMasters :request) fkie_multimaster_msgs::DiscoverMastersRequest)
(setf (get fkie_multimaster_msgs::DiscoverMasters :response) fkie_multimaster_msgs::DiscoverMastersResponse)

(defmethod fkie_multimaster_msgs::DiscoverMastersRequest
  (:response () (instance fkie_multimaster_msgs::DiscoverMastersResponse :init)))

(setf (get fkie_multimaster_msgs::DiscoverMastersRequest :md5sum-) "31a962d97ea3e3c12d428ff4786f124b")
(setf (get fkie_multimaster_msgs::DiscoverMastersRequest :datatype-) "fkie_multimaster_msgs/DiscoverMastersRequest")
(setf (get fkie_multimaster_msgs::DiscoverMastersRequest :definition-)
      "---
fkie_multimaster_msgs/ROSMaster[] masters


================================================================================
MSG: fkie_multimaster_msgs/ROSMaster
string name
# ROS Master URI
string uri
# The timestamp of the state of the remoter ROS master
time last_change
# The timestamp of the state of the remoter ROS master, without the changes maked while a synchronization.
time last_change_local
bool online
string discoverer_name
string monitoruri
")

(setf (get fkie_multimaster_msgs::DiscoverMastersResponse :md5sum-) "31a962d97ea3e3c12d428ff4786f124b")
(setf (get fkie_multimaster_msgs::DiscoverMastersResponse :datatype-) "fkie_multimaster_msgs/DiscoverMastersResponse")
(setf (get fkie_multimaster_msgs::DiscoverMastersResponse :definition-)
      "---
fkie_multimaster_msgs/ROSMaster[] masters


================================================================================
MSG: fkie_multimaster_msgs/ROSMaster
string name
# ROS Master URI
string uri
# The timestamp of the state of the remoter ROS master
time last_change
# The timestamp of the state of the remoter ROS master, without the changes maked while a synchronization.
time last_change_local
bool online
string discoverer_name
string monitoruri
")



(provide :fkie_multimaster_msgs/DiscoverMasters "31a962d97ea3e3c12d428ff4786f124b")


