;; Auto-generated. Do not edit!


(when (boundp 'actionlib_tutorials::LidarResult)
  (if (not (find-package "ACTIONLIB_TUTORIALS"))
    (make-package "ACTIONLIB_TUTORIALS"))
  (shadow 'LidarResult (find-package "ACTIONLIB_TUTORIALS")))
(unless (find-package "ACTIONLIB_TUTORIALS::LIDARRESULT")
  (make-package "ACTIONLIB_TUTORIALS::LIDARRESULT"))

(in-package "ROS")
;;//! \htmlinclude LidarResult.msg.html


(defclass actionlib_tutorials::LidarResult
  :super ros::object
  :slots (_final ))

(defmethod actionlib_tutorials::LidarResult
  (:init
   (&key
    ((:final __final) 0)
    )
   (send-super :init)
   (setq _final (round __final))
   self)
  (:final
   (&optional __final)
   (if __final (setq _final __final)) _final)
  (:serialization-length
   ()
   (+
    ;; int32 _final
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _final
       (write-long _final s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _final
     (setq _final (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get actionlib_tutorials::LidarResult :md5sum-) "e2aa29bfa110a0d8eeafa337cf7fa549")
(setf (get actionlib_tutorials::LidarResult :datatype-) "actionlib_tutorials/LidarResult")
(setf (get actionlib_tutorials::LidarResult :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
#result definition
int32 final

")



(provide :actionlib_tutorials/LidarResult "e2aa29bfa110a0d8eeafa337cf7fa549")

