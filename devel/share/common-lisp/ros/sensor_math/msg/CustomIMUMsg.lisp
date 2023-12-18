; Auto-generated. Do not edit!


(cl:in-package sensor_math-msg)


;//! \htmlinclude CustomIMUMsg.msg.html

(cl:defclass <CustomIMUMsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (acceleration
    :reader acceleration
    :initarg :acceleration
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (gyroscope
    :reader gyroscope
    :initarg :gyroscope
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (magnetometer
    :reader magnetometer
    :initarg :magnetometer
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass CustomIMUMsg (<CustomIMUMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CustomIMUMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CustomIMUMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_math-msg:<CustomIMUMsg> is deprecated: use sensor_math-msg:CustomIMUMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CustomIMUMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_math-msg:header-val is deprecated.  Use sensor_math-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'acceleration-val :lambda-list '(m))
(cl:defmethod acceleration-val ((m <CustomIMUMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_math-msg:acceleration-val is deprecated.  Use sensor_math-msg:acceleration instead.")
  (acceleration m))

(cl:ensure-generic-function 'gyroscope-val :lambda-list '(m))
(cl:defmethod gyroscope-val ((m <CustomIMUMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_math-msg:gyroscope-val is deprecated.  Use sensor_math-msg:gyroscope instead.")
  (gyroscope m))

(cl:ensure-generic-function 'magnetometer-val :lambda-list '(m))
(cl:defmethod magnetometer-val ((m <CustomIMUMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_math-msg:magnetometer-val is deprecated.  Use sensor_math-msg:magnetometer instead.")
  (magnetometer m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CustomIMUMsg>) ostream)
  "Serializes a message object of type '<CustomIMUMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'acceleration))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'gyroscope))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'magnetometer))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CustomIMUMsg>) istream)
  "Deserializes a message object of type '<CustomIMUMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:setf (cl:slot-value msg 'acceleration) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'acceleration)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'gyroscope) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'gyroscope)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'magnetometer) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'magnetometer)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CustomIMUMsg>)))
  "Returns string type for a message object of type '<CustomIMUMsg>"
  "sensor_math/CustomIMUMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CustomIMUMsg)))
  "Returns string type for a message object of type 'CustomIMUMsg"
  "sensor_math/CustomIMUMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CustomIMUMsg>)))
  "Returns md5sum for a message object of type '<CustomIMUMsg>"
  "e5caa9162e195ad161e6e93fe1f83380")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CustomIMUMsg)))
  "Returns md5sum for a message object of type 'CustomIMUMsg"
  "e5caa9162e195ad161e6e93fe1f83380")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CustomIMUMsg>)))
  "Returns full string definition for message of type '<CustomIMUMsg>"
  (cl:format cl:nil "#CustomIMUMsg.msg~%Header header~%~%float32[3] acceleration ~%float32[3] gyroscope~%float32[3] magnetometer~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CustomIMUMsg)))
  "Returns full string definition for message of type 'CustomIMUMsg"
  (cl:format cl:nil "#CustomIMUMsg.msg~%Header header~%~%float32[3] acceleration ~%float32[3] gyroscope~%float32[3] magnetometer~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CustomIMUMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'acceleration) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'gyroscope) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'magnetometer) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CustomIMUMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'CustomIMUMsg
    (cl:cons ':header (header msg))
    (cl:cons ':acceleration (acceleration msg))
    (cl:cons ':gyroscope (gyroscope msg))
    (cl:cons ':magnetometer (magnetometer msg))
))
