;; Auto-generated. Do not edit!


(when (boundp 'fkie_multimaster_msgs::LoadLaunch)
  (if (not (find-package "FKIE_MULTIMASTER_MSGS"))
    (make-package "FKIE_MULTIMASTER_MSGS"))
  (shadow 'LoadLaunch (find-package "FKIE_MULTIMASTER_MSGS")))
(unless (find-package "FKIE_MULTIMASTER_MSGS::LOADLAUNCH")
  (make-package "FKIE_MULTIMASTER_MSGS::LOADLAUNCH"))
(unless (find-package "FKIE_MULTIMASTER_MSGS::LOADLAUNCHREQUEST")
  (make-package "FKIE_MULTIMASTER_MSGS::LOADLAUNCHREQUEST"))
(unless (find-package "FKIE_MULTIMASTER_MSGS::LOADLAUNCHRESPONSE")
  (make-package "FKIE_MULTIMASTER_MSGS::LOADLAUNCHRESPONSE"))

(in-package "ROS")





(defclass fkie_multimaster_msgs::LoadLaunchRequest
  :super ros::object
  :slots (_path ))

(defmethod fkie_multimaster_msgs::LoadLaunchRequest
  (:init
   (&key
    ((:path __path) "")
    )
   (send-super :init)
   (setq _path (string __path))
   self)
  (:path
   (&optional __path)
   (if __path (setq _path __path)) _path)
  (:serialization-length
   ()
   (+
    ;; string _path
    4 (length _path)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _path
       (write-long (length _path) s) (princ _path s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _path
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _path (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass fkie_multimaster_msgs::LoadLaunchResponse
  :super ros::object
  :slots ())

(defmethod fkie_multimaster_msgs::LoadLaunchResponse
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

(defclass fkie_multimaster_msgs::LoadLaunch
  :super ros::object
  :slots ())

(setf (get fkie_multimaster_msgs::LoadLaunch :md5sum-) "1d00cd540af97efeb6b1589112fab63e")
(setf (get fkie_multimaster_msgs::LoadLaunch :datatype-) "fkie_multimaster_msgs/LoadLaunch")
(setf (get fkie_multimaster_msgs::LoadLaunch :request) fkie_multimaster_msgs::LoadLaunchRequest)
(setf (get fkie_multimaster_msgs::LoadLaunch :response) fkie_multimaster_msgs::LoadLaunchResponse)

(defmethod fkie_multimaster_msgs::LoadLaunchRequest
  (:response () (instance fkie_multimaster_msgs::LoadLaunchResponse :init)))

(setf (get fkie_multimaster_msgs::LoadLaunchRequest :md5sum-) "1d00cd540af97efeb6b1589112fab63e")
(setf (get fkie_multimaster_msgs::LoadLaunchRequest :datatype-) "fkie_multimaster_msgs/LoadLaunchRequest")
(setf (get fkie_multimaster_msgs::LoadLaunchRequest :definition-)
      "string path
---

")

(setf (get fkie_multimaster_msgs::LoadLaunchResponse :md5sum-) "1d00cd540af97efeb6b1589112fab63e")
(setf (get fkie_multimaster_msgs::LoadLaunchResponse :datatype-) "fkie_multimaster_msgs/LoadLaunchResponse")
(setf (get fkie_multimaster_msgs::LoadLaunchResponse :definition-)
      "string path
---

")



(provide :fkie_multimaster_msgs/LoadLaunch "1d00cd540af97efeb6b1589112fab63e")


