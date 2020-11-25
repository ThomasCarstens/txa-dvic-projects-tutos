
(cl:in-package :asdf)

(defsystem "actionlib_tutorials-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "killMotors" :depends-on ("_package_killMotors"))
    (:file "_package_killMotors" :depends-on ("_package"))
  ))