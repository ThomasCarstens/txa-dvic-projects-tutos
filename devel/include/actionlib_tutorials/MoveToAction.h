// Generated by gencpp from file actionlib_tutorials/MoveToAction.msg
// DO NOT EDIT!


#ifndef ACTIONLIB_TUTORIALS_MESSAGE_MOVETOACTION_H
#define ACTIONLIB_TUTORIALS_MESSAGE_MOVETOACTION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <actionlib_tutorials/MoveToActionGoal.h>
#include <actionlib_tutorials/MoveToActionResult.h>
#include <actionlib_tutorials/MoveToActionFeedback.h>

namespace actionlib_tutorials
{
template <class ContainerAllocator>
struct MoveToAction_
{
  typedef MoveToAction_<ContainerAllocator> Type;

  MoveToAction_()
    : action_goal()
    , action_result()
    , action_feedback()  {
    }
  MoveToAction_(const ContainerAllocator& _alloc)
    : action_goal(_alloc)
    , action_result(_alloc)
    , action_feedback(_alloc)  {
  (void)_alloc;
    }



   typedef  ::actionlib_tutorials::MoveToActionGoal_<ContainerAllocator>  _action_goal_type;
  _action_goal_type action_goal;

   typedef  ::actionlib_tutorials::MoveToActionResult_<ContainerAllocator>  _action_result_type;
  _action_result_type action_result;

   typedef  ::actionlib_tutorials::MoveToActionFeedback_<ContainerAllocator>  _action_feedback_type;
  _action_feedback_type action_feedback;





  typedef boost::shared_ptr< ::actionlib_tutorials::MoveToAction_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::actionlib_tutorials::MoveToAction_<ContainerAllocator> const> ConstPtr;

}; // struct MoveToAction_

typedef ::actionlib_tutorials::MoveToAction_<std::allocator<void> > MoveToAction;

typedef boost::shared_ptr< ::actionlib_tutorials::MoveToAction > MoveToActionPtr;
typedef boost::shared_ptr< ::actionlib_tutorials::MoveToAction const> MoveToActionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::actionlib_tutorials::MoveToAction_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::actionlib_tutorials::MoveToAction_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::actionlib_tutorials::MoveToAction_<ContainerAllocator1> & lhs, const ::actionlib_tutorials::MoveToAction_<ContainerAllocator2> & rhs)
{
  return lhs.action_goal == rhs.action_goal &&
    lhs.action_result == rhs.action_result &&
    lhs.action_feedback == rhs.action_feedback;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::actionlib_tutorials::MoveToAction_<ContainerAllocator1> & lhs, const ::actionlib_tutorials::MoveToAction_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace actionlib_tutorials

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::actionlib_tutorials::MoveToAction_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::actionlib_tutorials::MoveToAction_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::actionlib_tutorials::MoveToAction_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::actionlib_tutorials::MoveToAction_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::actionlib_tutorials::MoveToAction_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::actionlib_tutorials::MoveToAction_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::actionlib_tutorials::MoveToAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "241d1d6dae10fd4dc692914568999004";
  }

  static const char* value(const ::actionlib_tutorials::MoveToAction_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x241d1d6dae10fd4dULL;
  static const uint64_t static_value2 = 0xc692914568999004ULL;
};

template<class ContainerAllocator>
struct DataType< ::actionlib_tutorials::MoveToAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "actionlib_tutorials/MoveToAction";
  }

  static const char* value(const ::actionlib_tutorials::MoveToAction_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::actionlib_tutorials::MoveToAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"MoveToActionGoal action_goal\n"
"MoveToActionResult action_result\n"
"MoveToActionFeedback action_feedback\n"
"\n"
"================================================================================\n"
"MSG: actionlib_tutorials/MoveToActionGoal\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"Header header\n"
"actionlib_msgs/GoalID goal_id\n"
"MoveToGoal goal\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: actionlib_msgs/GoalID\n"
"# The stamp should store the time at which this goal was requested.\n"
"# It is used by an action server when it tries to preempt all\n"
"# goals that were requested before a certain time\n"
"time stamp\n"
"\n"
"# The id provides a way to associate feedback and\n"
"# result message with specific goal requests. The id\n"
"# specified must be unique.\n"
"string id\n"
"\n"
"\n"
"================================================================================\n"
"MSG: actionlib_tutorials/MoveToGoal\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# This is an action definition file, which has three parts: the goal\n"
"# the result, and the feedback.\n"
"# Part 1: the goal.\n"
"#\n"
"# The angle in degree the robot to turn, sent by client main\n"
"geometry_msgs/Point point\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: actionlib_tutorials/MoveToActionResult\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"Header header\n"
"actionlib_msgs/GoalStatus status\n"
"MoveToResult result\n"
"\n"
"================================================================================\n"
"MSG: actionlib_msgs/GoalStatus\n"
"GoalID goal_id\n"
"uint8 status\n"
"uint8 PENDING         = 0   # The goal has yet to be processed by the action server\n"
"uint8 ACTIVE          = 1   # The goal is currently being processed by the action server\n"
"uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing\n"
"                            #   and has since completed its execution (Terminal State)\n"
"uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)\n"
"uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due\n"
"                            #    to some failure (Terminal State)\n"
"uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,\n"
"                            #    because the goal was unattainable or invalid (Terminal State)\n"
"uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing\n"
"                            #    and has not yet completed execution\n"
"uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,\n"
"                            #    but the action server has not yet confirmed that the goal is canceled\n"
"uint8 RECALLED        = 8   # The goal received a cancel request before it started executing\n"
"                            #    and was successfully cancelled (Terminal State)\n"
"uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be\n"
"                            #    sent over the wire by an action server\n"
"\n"
"#Allow for the user to associate a string with GoalStatus for debugging\n"
"string text\n"
"\n"
"\n"
"================================================================================\n"
"MSG: actionlib_tutorials/MoveToResult\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# Part 2: the result, sent by action server unpon completion\n"
"#\n"
"# How much time used\n"
"duration time_elapsed\n"
"# How many updates thrown in total\n"
"uint32 updates_n\n"
"\n"
"================================================================================\n"
"MSG: actionlib_tutorials/MoveToActionFeedback\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"Header header\n"
"actionlib_msgs/GoalStatus status\n"
"MoveToFeedback feedback\n"
"\n"
"================================================================================\n"
"MSG: actionlib_tutorials/MoveToFeedback\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# Part 3: the feedback,to be sent periodically by server\n"
"#\n"
"# The amount of time elapsed from the start\n"
"duration time_elapsed\n"
;
  }

  static const char* value(const ::actionlib_tutorials::MoveToAction_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::actionlib_tutorials::MoveToAction_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.action_goal);
      stream.next(m.action_result);
      stream.next(m.action_feedback);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MoveToAction_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::actionlib_tutorials::MoveToAction_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::actionlib_tutorials::MoveToAction_<ContainerAllocator>& v)
  {
    s << indent << "action_goal: ";
    s << std::endl;
    Printer< ::actionlib_tutorials::MoveToActionGoal_<ContainerAllocator> >::stream(s, indent + "  ", v.action_goal);
    s << indent << "action_result: ";
    s << std::endl;
    Printer< ::actionlib_tutorials::MoveToActionResult_<ContainerAllocator> >::stream(s, indent + "  ", v.action_result);
    s << indent << "action_feedback: ";
    s << std::endl;
    Printer< ::actionlib_tutorials::MoveToActionFeedback_<ContainerAllocator> >::stream(s, indent + "  ", v.action_feedback);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ACTIONLIB_TUTORIALS_MESSAGE_MOVETOACTION_H