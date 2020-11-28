;; Auto-generated. Do not edit!


(when (boundp 'fkie_multimaster_msgs::MasterState)
  (if (not (find-package "FKIE_MULTIMASTER_MSGS"))
    (make-package "FKIE_MULTIMASTER_MSGS"))
  (shadow 'MasterState (find-package "FKIE_MULTIMASTER_MSGS")))
(unless (find-package "FKIE_MULTIMASTER_MSGS::MASTERSTATE")
  (make-package "FKIE_MULTIMASTER_MSGS::MASTERSTATE"))

(in-package "ROS")
;;//! \htmlinclude MasterState.msg.html


(intern "*STATE_NEW*" (find-package "FKIE_MULTIMASTER_MSGS::MASTERSTATE"))
(shadow '*STATE_NEW* (find-package "FKIE_MULTIMASTER_MSGS::MASTERSTATE"))
(defconstant fkie_multimaster_msgs::MasterState::*STATE_NEW* "new")
(intern "*STATE_REMOVED*" (find-package "FKIE_MULTIMASTER_MSGS::MASTERSTATE"))
(shadow '*STATE_REMOVED* (find-package "FKIE_MULTIMASTER_MSGS::MASTERSTATE"))
(defconstant fkie_multimaster_msgs::MasterState::*STATE_REMOVED* "removed")
(intern "*STATE_CHANGED*" (find-package "FKIE_MULTIMASTER_MSGS::MASTERSTATE"))
(shadow '*STATE_CHANGED* (find-package "FKIE_MULTIMASTER_MSGS::MASTERSTATE"))
(defconstant fkie_multimaster_msgs::MasterState::*STATE_CHANGED* "changed")
(defclass fkie_multimaster_msgs::MasterState
  :super ros::object
  :slots (_state _master ))

(defmethod fkie_multimaster_msgs::MasterState
  (:init
   (&key
    ((:state __state) "")
    ((:master __master) (instance fkie_multimaster_msgs::ROSMaster :init))
    )
   (send-super :init)
   (setq _state (string __state))
   (setq _master __master)
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:master
   (&rest __master)
   (if (keywordp (car __master))
       (send* _master __master)
     (progn
       (if __master (setq _master (car __master)))
       _master)))
  (:serialization-length
   ()
   (+
    ;; string _state
    4 (length _state)
    ;; fkie_multimaster_msgs/ROSMaster _master
    (send _master :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _state
       (write-long (length _state) s) (princ _state s)
     ;; fkie_multimaster_msgs/ROSMaster _master
       (send _master :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _state
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _state (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; fkie_multimaster_msgs/ROSMaster _master
     (send _master :deserialize buf ptr-) (incf ptr- (send _master :serialization-length))
   ;;
   self)
  )

(setf (get fkie_multimaster_msgs::MasterState :md5sum-) "d25ba81effb888c4150d378d8adedb03")
(setf (get fkie_multimaster_msgs::MasterState :datatype-) "fkie_multimaster_msgs/MasterState")
(setf (get fkie_multimaster_msgs::MasterState :definition-)
      "string state
fkie_multimaster_msgs/ROSMaster master

string STATE_NEW=new
string STATE_REMOVED=removed
string STATE_CHANGED=changed

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



(provide :fkie_multimaster_msgs/MasterState "d25ba81effb888c4150d378d8adedb03")


