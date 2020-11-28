// Auto-generated. Do not edit!

// (in-package fkie_multimaster_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class LinkState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.destination = null;
      this.quality = null;
      this.last_heartbeat = null;
    }
    else {
      if (initObj.hasOwnProperty('destination')) {
        this.destination = initObj.destination
      }
      else {
        this.destination = '';
      }
      if (initObj.hasOwnProperty('quality')) {
        this.quality = initObj.quality
      }
      else {
        this.quality = 0.0;
      }
      if (initObj.hasOwnProperty('last_heartbeat')) {
        this.last_heartbeat = initObj.last_heartbeat
      }
      else {
        this.last_heartbeat = {secs: 0, nsecs: 0};
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LinkState
    // Serialize message field [destination]
    bufferOffset = _serializer.string(obj.destination, buffer, bufferOffset);
    // Serialize message field [quality]
    bufferOffset = _serializer.float32(obj.quality, buffer, bufferOffset);
    // Serialize message field [last_heartbeat]
    bufferOffset = _serializer.time(obj.last_heartbeat, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LinkState
    let len;
    let data = new LinkState(null);
    // Deserialize message field [destination]
    data.destination = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [quality]
    data.quality = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [last_heartbeat]
    data.last_heartbeat = _deserializer.time(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.destination.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'fkie_multimaster_msgs/LinkState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fd2554dabc9a5d69f4842dd42dd3e0f3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string destination
    float32 quality
    # The timestamp of the last received heartbeat message
    time last_heartbeat
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LinkState(null);
    if (msg.destination !== undefined) {
      resolved.destination = msg.destination;
    }
    else {
      resolved.destination = ''
    }

    if (msg.quality !== undefined) {
      resolved.quality = msg.quality;
    }
    else {
      resolved.quality = 0.0
    }

    if (msg.last_heartbeat !== undefined) {
      resolved.last_heartbeat = msg.last_heartbeat;
    }
    else {
      resolved.last_heartbeat = {secs: 0, nsecs: 0}
    }

    return resolved;
    }
};

module.exports = LinkState;
