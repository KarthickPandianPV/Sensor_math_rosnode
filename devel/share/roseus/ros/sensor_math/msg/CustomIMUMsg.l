;; Auto-generated. Do not edit!


(when (boundp 'sensor_math::CustomIMUMsg)
  (if (not (find-package "SENSOR_MATH"))
    (make-package "SENSOR_MATH"))
  (shadow 'CustomIMUMsg (find-package "SENSOR_MATH")))
(unless (find-package "SENSOR_MATH::CUSTOMIMUMSG")
  (make-package "SENSOR_MATH::CUSTOMIMUMSG"))

(in-package "ROS")
;;//! \htmlinclude CustomIMUMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sensor_math::CustomIMUMsg
  :super ros::object
  :slots (_header _acceleration _gyroscope _magnetometer ))

(defmethod sensor_math::CustomIMUMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:acceleration __acceleration) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:gyroscope __gyroscope) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:magnetometer __magnetometer) (make-array 3 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _acceleration __acceleration)
   (setq _gyroscope __gyroscope)
   (setq _magnetometer __magnetometer)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:acceleration
   (&optional __acceleration)
   (if __acceleration (setq _acceleration __acceleration)) _acceleration)
  (:gyroscope
   (&optional __gyroscope)
   (if __gyroscope (setq _gyroscope __gyroscope)) _gyroscope)
  (:magnetometer
   (&optional __magnetometer)
   (if __magnetometer (setq _magnetometer __magnetometer)) _magnetometer)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32[3] _acceleration
    (* 4    3)
    ;; float32[3] _gyroscope
    (* 4    3)
    ;; float32[3] _magnetometer
    (* 4    3)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32[3] _acceleration
     (dotimes (i 3)
       (sys::poke (elt _acceleration i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[3] _gyroscope
     (dotimes (i 3)
       (sys::poke (elt _gyroscope i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[3] _magnetometer
     (dotimes (i 3)
       (sys::poke (elt _magnetometer i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32[3] _acceleration
   (dotimes (i (length _acceleration))
     (setf (elt _acceleration i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[3] _gyroscope
   (dotimes (i (length _gyroscope))
     (setf (elt _gyroscope i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[3] _magnetometer
   (dotimes (i (length _magnetometer))
     (setf (elt _magnetometer i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get sensor_math::CustomIMUMsg :md5sum-) "e5caa9162e195ad161e6e93fe1f83380")
(setf (get sensor_math::CustomIMUMsg :datatype-) "sensor_math/CustomIMUMsg")
(setf (get sensor_math::CustomIMUMsg :definition-)
      "#CustomIMUMsg.msg
Header header

float32[3] acceleration 
float32[3] gyroscope
float32[3] magnetometer

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :sensor_math/CustomIMUMsg "e5caa9162e195ad161e6e93fe1f83380")


