// Generated by gencpp from file actionlib_tutorials/MoveToFeedback.msg
// DO NOT EDIT!


#ifndef ACTIONLIB_TUTORIALS_MESSAGE_MOVETOFEEDBACK_H
#define ACTIONLIB_TUTORIALS_MESSAGE_MOVETOFEEDBACK_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Pose.h>

namespace actionlib_tutorials
{
template <class ContainerAllocator>
struct MoveToFeedback_
{
  typedef MoveToFeedback_<ContainerAllocator> Type;

  MoveToFeedback_()
    : time_elapsed()
    , position()  {
    }
  MoveToFeedback_(const ContainerAllocator& _alloc)
    : time_elapsed()
    , position(_alloc)  {
  (void)_alloc;
    }



   typedef ros::Duration _time_elapsed_type;
  _time_elapsed_type time_elapsed;

   typedef  ::geometry_msgs::Pose_<ContainerAllocator>  _position_type;
  _position_type position;





  typedef boost::shared_ptr< ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator> const> ConstPtr;

}; // struct MoveToFeedback_

typedef ::actionlib_tutorials::MoveToFeedback_<std::allocator<void> > MoveToFeedback;

typedef boost::shared_ptr< ::actionlib_tutorials::MoveToFeedback > MoveToFeedbackPtr;
typedef boost::shared_ptr< ::actionlib_tutorials::MoveToFeedback const> MoveToFeedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator1> & lhs, const ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator2> & rhs)
{
  return lhs.time_elapsed == rhs.time_elapsed &&
    lhs.position == rhs.position;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator1> & lhs, const ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace actionlib_tutorials

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "54c4c071a26b91ca48642da204d5e25e";
  }

  static const char* value(const ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x54c4c071a26b91caULL;
  static const uint64_t static_value2 = 0x48642da204d5e25eULL;
};

template<class ContainerAllocator>
struct DataType< ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "actionlib_tutorials/MoveToFeedback";
  }

  static const char* value(const ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# Part 3: the feedback,to be sent periodically by server\n"
"#\n"
"# The amount of time elapsed from the start\n"
"duration time_elapsed\n"
"#Where the drone is\n"
"geometry_msgs/Pose position\n"
"\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Pose\n"
"# A representation of pose in free space, composed of position and orientation. \n"
"Point position\n"
"Quaternion orientation\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
;
  }

  static const char* value(const ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.time_elapsed);
      stream.next(m.position);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MoveToFeedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::actionlib_tutorials::MoveToFeedback_<ContainerAllocator>& v)
  {
    s << indent << "time_elapsed: ";
    Printer<ros::Duration>::stream(s, indent + "  ", v.time_elapsed);
    s << indent << "position: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose_<ContainerAllocator> >::stream(s, indent + "  ", v.position);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ACTIONLIB_TUTORIALS_MESSAGE_MOVETOFEEDBACK_H
