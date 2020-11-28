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

class ROSMaster {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.uri = null;
      this.last_change = null;
      this.last_change_local = null;
      this.online = null;
      this.discoverer_name = null;
      this.monitoruri = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('uri')) {
        this.uri = initObj.uri
      }
      else {
        this.uri = '';
      }
      if (initObj.hasOwnProperty('last_change')) {
        this.last_change = initObj.last_change
      }
      else {
        this.last_change = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('last_change_local')) {
        this.last_change_local = initObj.last_change_local
      }
      else {
        this.last_change_local = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('online')) {
        this.online = initObj.online
      }
      else {
        this.online = false;
      }
      if (initObj.hasOwnProperty('discoverer_name')) {
        this.discoverer_name = initObj.discoverer_name
      }
      else {
        this.discoverer_name = '';
      }
      if (initObj.hasOwnProperty('monitoruri')) {
        this.monitoruri = initObj.monitoruri
      }
      else {
        this.monitoruri = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ROSMaster
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [uri]
    bufferOffset = _serializer.string(obj.uri, buffer, bufferOffset);
    // Serialize message field [last_change]
    bufferOffset = _serializer.time(obj.last_change, buffer, bufferOffset);
    // Serialize message field [last_change_local]
    bufferOffset = _serializer.time(obj.last_change_local, buffer, bufferOffset);
    // Serialize message field [online]
    bufferOffset = _serializer.bool(obj.online, buffer, bufferOffset);
    // Serialize message field [discoverer_name]
    bufferOffset = _serializer.string(obj.discoverer_name, buffer, bufferOffset);
    // Serialize message field [monitoruri]
    bufferOffset = _serializer.string(obj.monitoruri, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ROSMaster
    let len;
    let data = new ROSMaster(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [uri]
    data.uri = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [last_change]
    data.last_change = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [last_change_local]
    data.last_change_local = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [online]
    data.online = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [discoverer_name]
    data.discoverer_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [monitoruri]
    data.monitoruri = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.name.length;
    length += object.uri.length;
    length += object.discoverer_name.length;
    length += object.monitoruri.length;
    return length + 33;
  }

  static datatype() {
    // Returns string type for a message object
    return 'fkie_multimaster_msgs/ROSMaster';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0789d85e02ce55a78b1df2459150a275';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
    # ROS Master URI
    string uri
    # The timestamp of the state of the remoter ROS master
    time last_change
    # The timestamp of the state of the remoter ROS master, without the changes maked while a synchronization.
    time last_change_local
    bool online
    string discoverer_name
    string monitoruri
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ROSMaster(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.uri !== undefined) {
      resolved.uri = msg.uri;
    }
    else {
      resolved.uri = ''
    }

    if (msg.last_change !== undefined) {
      resolved.last_change = msg.last_change;
    }
    else {
      resolved.last_change = {secs: 0, nsecs: 0}
    }

    if (msg.last_change_local !== undefined) {
      resolved.last_change_local = msg.last_change_local;
    }
    else {
      resolved.last_change_local = {secs: 0, nsecs: 0}
    }

    if (msg.online !== undefined) {
      resolved.online = msg.online;
    }
    else {
      resolved.online = false
    }

    if (msg.discoverer_name !== undefined) {
      resolved.discoverer_name = msg.discoverer_name;
    }
    else {
      resolved.discoverer_name = ''
    }

    if (msg.monitoruri !== undefined) {
      resolved.monitoruri = msg.monitoruri;
    }
    else {
      resolved.monitoruri = ''
    }

    return resolved;
    }
};

module.exports = ROSMaster;
