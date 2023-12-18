; Auto-generated. Do not edit!


(cl:in-package sensor_math-msg)


;//! \htmlinclude CustomDepthMsg.msg.html

(cl:defclass <CustomDepthMsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (depth
    :reader depth
    :initarg :depth
    :type cl:float
    :initform 0.0))
)

(cl:defclass CustomDepthMsg (<CustomDepthMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CustomDepthMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CustomDepthMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_math-msg:<CustomDepthMsg> is deprecated: use sensor_math-msg:CustomDepthMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CustomDepthMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_math-msg:header-val is deprecated.  Use sensor_math-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'depth-val :lambda-list '(m))
(cl:defmethod depth-val ((m <CustomDepthMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_math-msg:depth-val is deprecated.  Use sensor_math-msg:depth instead.")
  (depth m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CustomDepthMsg>) ostream)
  "Serializes a message object of type '<CustomDepthMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'depth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CustomDepthMsg>) istream)
  "Deserializes a message object of type '<CustomDepthMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CustomDepthMsg>)))
  "Returns string type for a message object of type '<CustomDepthMsg>"
  "sensor_math/CustomDepthMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CustomDepthMsg)))
  "Returns string type for a message object of type 'CustomDepthMsg"
  "sensor_math/CustomDepthMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CustomDepthMsg>)))
  "Returns md5sum for a message object of type '<CustomDepthMsg>"
  "ecaa3eb2663713277f30af306d8347d1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CustomDepthMsg)))
  "Returns md5sum for a message object of type 'CustomDepthMsg"
  "ecaa3eb2663713277f30af306d8347d1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CustomDepthMsg>)))
  "Returns full string definition for message of type '<CustomDepthMsg>"
  (cl:format cl:nil "#CustomDepthMsg.msg~%Header header~%~%float32 depth~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CustomDepthMsg)))
  "Returns full string definition for message of type 'CustomDepthMsg"
  (cl:format cl:nil "#CustomDepthMsg.msg~%Header header~%~%float32 depth~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CustomDepthMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CustomDepthMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'CustomDepthMsg
    (cl:cons ':header (header msg))
    (cl:cons ':depth (depth msg))
))
