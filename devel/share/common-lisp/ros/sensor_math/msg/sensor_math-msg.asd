
(cl:in-package :asdf)

(defsystem "sensor_math-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "CustomDepthMsg" :depends-on ("_package_CustomDepthMsg"))
    (:file "_package_CustomDepthMsg" :depends-on ("_package"))
    (:file "CustomIMUMsg" :depends-on ("_package_CustomIMUMsg"))
    (:file "_package_CustomIMUMsg" :depends-on ("_package"))
    (:file "CustomOrientationMsg" :depends-on ("_package_CustomOrientationMsg"))
    (:file "_package_CustomOrientationMsg" :depends-on ("_package"))
  ))