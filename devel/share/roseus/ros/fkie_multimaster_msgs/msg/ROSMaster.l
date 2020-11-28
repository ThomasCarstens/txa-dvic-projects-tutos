;; Auto-generated. Do not edit!


(when (boundp 'fkie_multimaster_msgs::ROSMaster)
  (if (not (find-package "FKIE_MULTIMASTER_MSGS"))
    (make-package "FKIE_MULTIMASTER_MSGS"))
  (shadow 'ROSMaster (find-package "FKIE_MULTIMASTER_MSGS")))
(unless (find-package "FKIE_MULTIMASTER_MSGS::ROSMASTER")
  (make-package "FKIE_MULTIMASTER_MSGS::ROSMASTER"))

(in-package "ROS")
;;//! \htmlinclude ROSMaster.msg.html


(defclass fkie_multimaster_msgs::ROSMaster
  :super ros::object
  :slots (_name _uri _last_change _last_change_local _online _discoverer_name _monitoruri ))

(defmethod fkie_multimaster_msgs::ROSMaster
  (:init
   (&key
    ((:name __name) "")
    ((:uri __uri) "")
    ((:last_change __last_change) (instance ros::time :init))
    ((:last_change_local __last_change_local) (instance ros::time :init))
    ((:online __online) nil)
    ((:discoverer_name __discoverer_name) "")
    ((:monitoruri __monitoruri) "")
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _uri (string __uri))
   (setq _last_change __last_change)
   (setq _last_change_local __last_change_local)
   (setq _online __online)
   (setq _discoverer_name (string __discoverer_name))
   (setq _monitoruri (string __monitoruri))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:uri
   (&optional __uri)
   (if __uri (setq _uri __uri)) _uri)
  (:last_change
   (&optional __last_change)
   (if __last_change (setq _last_change __last_change)) _last_change)
  (:last_change_local
   (&optional __last_change_local)
   (if __last_change_local (setq _last_change_local __last_change_local)) _last_change_local)
  (:online
   (&optional __online)
   (if __online (setq _online __online)) _online)
  (:discoverer_name
   (&optional __discoverer_name)
   (if __discoverer_name (setq _discoverer_name __discoverer_name)) _discoverer_name)
  (:monitoruri
   (&optional __monitoruri)
   (if __monitoruri (setq _monitoruri __monitoruri)) _monitoruri)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; string _uri
    4 (length _uri)
    ;; time _last_change
    8
    ;; time _last_change_local
    8
    ;; bool _online
    1
    ;; string _discoverer_name
    4 (length _discoverer_name)
    ;; string _monitoruri
    4 (length _monitoruri)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; string _uri
       (write-long (length _uri) s) (princ _uri s)
     ;; time _last_change
       (write-long (send _last_change :sec) s) (write-long (send _last_change :nsec) s)
     ;; time _last_change_local
       (write-long (send _last_change_local :sec) s) (write-long (send _last_change_local :nsec) s)
     ;; bool _online
       (if _online (write-byte -1 s) (write-byte 0 s))
     ;; string _discoverer_name
       (write-long (length _discoverer_name) s) (princ _discoverer_name s)
     ;; string _monitoruri
       (write-long (length _monitoruri) s) (princ _monitoruri s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _uri
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _uri (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; time _last_change
     (send _last_change :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _last_change :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; time _last_change_local
     (send _last_change_local :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _last_change_local :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _online
     (setq _online (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _discoverer_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _discoverer_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _monitoruri
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _monitoruri (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get fkie_multimaster_msgs::ROSMaster :md5sum-) "0789d85e02ce55a78b1df2459150a275")
(setf (get fkie_multimaster_msgs::ROSMaster :datatype-) "fkie_multimaster_msgs/ROSMaster")
(setf (get fkie_multimaster_msgs::ROSMaster :definition-)
      "string name
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



(provide :fkie_multimaster_msgs/ROSMaster "0789d85e02ce55a78b1df2459150a275")


