;; Auto-generated. Do not edit!


(when (boundp 'fkie_multimaster_msgs::Task)
  (if (not (find-package "FKIE_MULTIMASTER_MSGS"))
    (make-package "FKIE_MULTIMASTER_MSGS"))
  (shadow 'Task (find-package "FKIE_MULTIMASTER_MSGS")))
(unless (find-package "FKIE_MULTIMASTER_MSGS::TASK")
  (make-package "FKIE_MULTIMASTER_MSGS::TASK"))
(unless (find-package "FKIE_MULTIMASTER_MSGS::TASKREQUEST")
  (make-package "FKIE_MULTIMASTER_MSGS::TASKREQUEST"))
(unless (find-package "FKIE_MULTIMASTER_MSGS::TASKRESPONSE")
  (make-package "FKIE_MULTIMASTER_MSGS::TASKRESPONSE"))

(in-package "ROS")





(defclass fkie_multimaster_msgs::TaskRequest
  :super ros::object
  :slots (_node ))

(defmethod fkie_multimaster_msgs::TaskRequest
  (:init
   (&key
    ((:node __node) "")
    )
   (send-super :init)
   (setq _node (string __node))
   self)
  (:node
   (&optional __node)
   (if __node (setq _node __node)) _node)
  (:serialization-length
   ()
   (+
    ;; string _node
    4 (length _node)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _node
       (write-long (length _node) s) (princ _node s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _node
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _node (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass fkie_multimaster_msgs::TaskResponse
  :super ros::object
  :slots ())

(defmethod fkie_multimaster_msgs::TaskResponse
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

(defclass fkie_multimaster_msgs::Task
  :super ros::object
  :slots ())

(setf (get fkie_multimaster_msgs::Task :md5sum-) "a94c40e70a4b82863e6e52ec16732447")
(setf (get fkie_multimaster_msgs::Task :datatype-) "fkie_multimaster_msgs/Task")
(setf (get fkie_multimaster_msgs::Task :request) fkie_multimaster_msgs::TaskRequest)
(setf (get fkie_multimaster_msgs::Task :response) fkie_multimaster_msgs::TaskResponse)

(defmethod fkie_multimaster_msgs::TaskRequest
  (:response () (instance fkie_multimaster_msgs::TaskResponse :init)))

(setf (get fkie_multimaster_msgs::TaskRequest :md5sum-) "a94c40e70a4b82863e6e52ec16732447")
(setf (get fkie_multimaster_msgs::TaskRequest :datatype-) "fkie_multimaster_msgs/TaskRequest")
(setf (get fkie_multimaster_msgs::TaskRequest :definition-)
      "string node
---

")

(setf (get fkie_multimaster_msgs::TaskResponse :md5sum-) "a94c40e70a4b82863e6e52ec16732447")
(setf (get fkie_multimaster_msgs::TaskResponse :datatype-) "fkie_multimaster_msgs/TaskResponse")
(setf (get fkie_multimaster_msgs::TaskResponse :definition-)
      "string node
---

")



(provide :fkie_multimaster_msgs/Task "a94c40e70a4b82863e6e52ec16732447")


