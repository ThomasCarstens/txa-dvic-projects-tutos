;; Auto-generated. Do not edit!


(when (boundp 'fkie_multimaster_msgs::LinkState)
  (if (not (find-package "FKIE_MULTIMASTER_MSGS"))
    (make-package "FKIE_MULTIMASTER_MSGS"))
  (shadow 'LinkState (find-package "FKIE_MULTIMASTER_MSGS")))
(unless (find-package "FKIE_MULTIMASTER_MSGS::LINKSTATE")
  (make-package "FKIE_MULTIMASTER_MSGS::LINKSTATE"))

(in-package "ROS")
;;//! \htmlinclude LinkState.msg.html


(defclass fkie_multimaster_msgs::LinkState
  :super ros::object
  :slots (_destination _quality _last_heartbeat ))

(defmethod fkie_multimaster_msgs::LinkState
  (:init
   (&key
    ((:destination __destination) "")
    ((:quality __quality) 0.0)
    ((:last_heartbeat __last_heartbeat) (instance ros::time :init))
    )
   (send-super :init)
   (setq _destination (string __destination))
   (setq _quality (float __quality))
   (setq _last_heartbeat __last_heartbeat)
   self)
  (:destination
   (&optional __destination)
   (if __destination (setq _destination __destination)) _destination)
  (:quality
   (&optional __quality)
   (if __quality (setq _quality __quality)) _quality)
  (:last_heartbeat
   (&optional __last_heartbeat)
   (if __last_heartbeat (setq _last_heartbeat __last_heartbeat)) _last_heartbeat)
  (:serialization-length
   ()
   (+
    ;; string _destination
    4 (length _destination)
    ;; float32 _quality
    4
    ;; time _last_heartbeat
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _destination
       (write-long (length _destination) s) (princ _destination s)
     ;; float32 _quality
       (sys::poke _quality (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; time _last_heartbeat
       (write-long (send _last_heartbeat :sec) s) (write-long (send _last_heartbeat :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _destination
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _destination (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _quality
     (setq _quality (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; time _last_heartbeat
     (send _last_heartbeat :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _last_heartbeat :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get fkie_multimaster_msgs::LinkState :md5sum-) "fd2554dabc9a5d69f4842dd42dd3e0f3")
(setf (get fkie_multimaster_msgs::LinkState :datatype-) "fkie_multimaster_msgs/LinkState")
(setf (get fkie_multimaster_msgs::LinkState :definition-)
      "string destination
float32 quality
# The timestamp of the last received heartbeat message
time last_heartbeat

")



(provide :fkie_multimaster_msgs/LinkState "fd2554dabc9a5d69f4842dd42dd3e0f3")


