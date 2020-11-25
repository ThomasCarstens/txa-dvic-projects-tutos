;; Auto-generated. Do not edit!


(when (boundp 'actionlib_tutorials::killMotors)
  (if (not (find-package "ACTIONLIB_TUTORIALS"))
    (make-package "ACTIONLIB_TUTORIALS"))
  (shadow 'killMotors (find-package "ACTIONLIB_TUTORIALS")))
(unless (find-package "ACTIONLIB_TUTORIALS::KILLMOTORS")
  (make-package "ACTIONLIB_TUTORIALS::KILLMOTORS"))
(unless (find-package "ACTIONLIB_TUTORIALS::KILLMOTORSREQUEST")
  (make-package "ACTIONLIB_TUTORIALS::KILLMOTORSREQUEST"))
(unless (find-package "ACTIONLIB_TUTORIALS::KILLMOTORSRESPONSE")
  (make-package "ACTIONLIB_TUTORIALS::KILLMOTORSRESPONSE"))

(in-package "ROS")





(defclass actionlib_tutorials::killMotorsRequest
  :super ros::object
  :slots (_id ))

(defmethod actionlib_tutorials::killMotorsRequest
  (:init
   (&key
    ((:id __id) 0)
    )
   (send-super :init)
   (setq _id (round __id))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:serialization-length
   ()
   (+
    ;; int64 _id
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _id) (= (length (_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_id . bv) 0) 0) s)
              (write-long (ash (elt (_id . bv) 1) -1) s))
             ((and (class _id) (= (length (_id . bv)) 1)) ;; big1
              (write-long (elt (_id . bv) 0) s)
              (write-long (if (>= _id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _id s)(write-long (if (>= _id 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _id
#+(or :alpha :irix6 :x86_64)
      (setf _id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass actionlib_tutorials::killMotorsResponse
  :super ros::object
  :slots (_result ))

(defmethod actionlib_tutorials::killMotorsResponse
  (:init
   (&key
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _result (round __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; int64 _result
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _result
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _result (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _result) (= (length (_result . bv)) 2)) ;; bignum
              (write-long (ash (elt (_result . bv) 0) 0) s)
              (write-long (ash (elt (_result . bv) 1) -1) s))
             ((and (class _result) (= (length (_result . bv)) 1)) ;; big1
              (write-long (elt (_result . bv) 0) s)
              (write-long (if (>= _result 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _result s)(write-long (if (>= _result 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _result
#+(or :alpha :irix6 :x86_64)
      (setf _result (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _result (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass actionlib_tutorials::killMotors
  :super ros::object
  :slots ())

(setf (get actionlib_tutorials::killMotors :md5sum-) "77c661ef85dbd8d8b9b8b41a8c29118f")
(setf (get actionlib_tutorials::killMotors :datatype-) "actionlib_tutorials/killMotors")
(setf (get actionlib_tutorials::killMotors :request) actionlib_tutorials::killMotorsRequest)
(setf (get actionlib_tutorials::killMotors :response) actionlib_tutorials::killMotorsResponse)

(defmethod actionlib_tutorials::killMotorsRequest
  (:response () (instance actionlib_tutorials::killMotorsResponse :init)))

(setf (get actionlib_tutorials::killMotorsRequest :md5sum-) "77c661ef85dbd8d8b9b8b41a8c29118f")
(setf (get actionlib_tutorials::killMotorsRequest :datatype-) "actionlib_tutorials/killMotorsRequest")
(setf (get actionlib_tutorials::killMotorsRequest :definition-)
      "int64 id
---
int64 result
")

(setf (get actionlib_tutorials::killMotorsResponse :md5sum-) "77c661ef85dbd8d8b9b8b41a8c29118f")
(setf (get actionlib_tutorials::killMotorsResponse :datatype-) "actionlib_tutorials/killMotorsResponse")
(setf (get actionlib_tutorials::killMotorsResponse :definition-)
      "int64 id
---
int64 result
")



(provide :actionlib_tutorials/killMotors "77c661ef85dbd8d8b9b8b41a8c29118f")


