// Generated by gencpp from file actionlib_tutorials/LidarFeedback.msg
// DO NOT EDIT!


#ifndef ACTIONLIB_TUTORIALS_MESSAGE_LIDARFEEDBACK_H
#define ACTIONLIB_TUTORIALS_MESSAGE_LIDARFEEDBACK_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace actionlib_tutorials
{
template <class ContainerAllocator>
struct LidarFeedback_
{
  typedef LidarFeedback_<ContainerAllocator> Type;

  LidarFeedback_()
    : distance(0)  {
    }
  LidarFeedback_(const ContainerAllocator& _alloc)
    : distance(0)  {
  (void)_alloc;
    }



   typedef int32_t _distance_type;
  _distance_type distance;





  typedef boost::shared_ptr< ::actionlib_tutorials::LidarFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::actionlib_tutorials::LidarFeedback_<ContainerAllocator> const> ConstPtr;

}; // struct LidarFeedback_

typedef ::actionlib_tutorials::LidarFeedback_<std::allocator<void> > LidarFeedback;

typedef boost::shared_ptr< ::actionlib_tutorials::LidarFeedback > LidarFeedbackPtr;
typedef boost::shared_ptr< ::actionlib_tutorials::LidarFeedback const> LidarFeedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::actionlib_tutorials::LidarFeedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::actionlib_tutorials::LidarFeedback_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::actionlib_tutorials::LidarFeedback_<ContainerAllocator1> & lhs, const ::actionlib_tutorials::LidarFeedback_<ContainerAllocator2> & rhs)
{
  return lhs.distance == rhs.distance;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::actionlib_tutorials::LidarFeedback_<ContainerAllocator1> & lhs, const ::actionlib_tutorials::LidarFeedback_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace actionlib_tutorials

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::actionlib_tutorials::LidarFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::actionlib_tutorials::LidarFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::actionlib_tutorials::LidarFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::actionlib_tutorials::LidarFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::actionlib_tutorials::LidarFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::actionlib_tutorials::LidarFeedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::actionlib_tutorials::LidarFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "680f8923bb6b23ec7057fffc11ea7b34";
  }

  static const char* value(const ::actionlib_tutorials::LidarFeedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x680f8923bb6b23ecULL;
  static const uint64_t static_value2 = 0x7057fffc11ea7b34ULL;
};

template<class ContainerAllocator>
struct DataType< ::actionlib_tutorials::LidarFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "actionlib_tutorials/LidarFeedback";
  }

  static const char* value(const ::actionlib_tutorials::LidarFeedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::actionlib_tutorials::LidarFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"#feedback\n"
"int32 distance\n"
"\n"
;
  }

  static const char* value(const ::actionlib_tutorials::LidarFeedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::actionlib_tutorials::LidarFeedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.distance);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct LidarFeedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::actionlib_tutorials::LidarFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::actionlib_tutorials::LidarFeedback_<ContainerAllocator>& v)
  {
    s << indent << "distance: ";
    Printer<int32_t>::stream(s, indent + "  ", v.distance);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ACTIONLIB_TUTORIALS_MESSAGE_LIDARFEEDBACK_H
