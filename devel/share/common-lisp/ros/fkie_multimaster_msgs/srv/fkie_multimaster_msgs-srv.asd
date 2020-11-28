
(cl:in-package :asdf)

(defsystem "fkie_multimaster_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :fkie_multimaster_msgs-msg
)
  :components ((:file "_package")
    (:file "DiscoverMasters" :depends-on ("_package_DiscoverMasters"))
    (:file "_package_DiscoverMasters" :depends-on ("_package"))
    (:file "GetSyncInfo" :depends-on ("_package_GetSyncInfo"))
    (:file "_package_GetSyncInfo" :depends-on ("_package"))
    (:file "LoadLaunch" :depends-on ("_package_LoadLaunch"))
    (:file "_package_LoadLaunch" :depends-on ("_package"))
    (:file "Task" :depends-on ("_package_Task"))
    (:file "_package_Task" :depends-on ("_package"))
  ))