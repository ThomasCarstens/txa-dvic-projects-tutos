# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from actionlib_tutorials/my_newResult.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import genpy

class my_newResult(genpy.Message):
  _md5sum = "ec7b9dd60f0cbf3a48147f1dd0e2c305"
  _type = "actionlib_tutorials/my_newResult"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Part 2: the result, sent by action server unpon completion
#
# How much time used
duration time_elapsed
# How many updates thrown in total
uint32 updates_n
"""
  __slots__ = ['time_elapsed','updates_n']
  _slot_types = ['duration','uint32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       time_elapsed,updates_n

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(my_newResult, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.time_elapsed is None:
        self.time_elapsed = genpy.Duration()
      if self.updates_n is None:
        self.updates_n = 0
    else:
      self.time_elapsed = genpy.Duration()
      self.updates_n = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_2iI().pack(_x.time_elapsed.secs, _x.time_elapsed.nsecs, _x.updates_n))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.time_elapsed is None:
        self.time_elapsed = genpy.Duration()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.time_elapsed.secs, _x.time_elapsed.nsecs, _x.updates_n,) = _get_struct_2iI().unpack(str[start:end])
      self.time_elapsed.canon()
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_2iI().pack(_x.time_elapsed.secs, _x.time_elapsed.nsecs, _x.updates_n))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.time_elapsed is None:
        self.time_elapsed = genpy.Duration()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.time_elapsed.secs, _x.time_elapsed.nsecs, _x.updates_n,) = _get_struct_2iI().unpack(str[start:end])
      self.time_elapsed.canon()
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2iI = None
def _get_struct_2iI():
    global _struct_2iI
    if _struct_2iI is None:
        _struct_2iI = struct.Struct("<2iI")
    return _struct_2iI
