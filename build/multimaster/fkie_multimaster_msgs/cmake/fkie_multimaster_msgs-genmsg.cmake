# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "fkie_multimaster_msgs: 7 messages, 4 services")

set(MSG_I_FLAGS "-Ifkie_multimaster_msgs:/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(fkie_multimaster_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/LoadLaunch.srv" NAME_WE)
add_custom_target(_fkie_multimaster_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fkie_multimaster_msgs" "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/LoadLaunch.srv" ""
)

get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkState.msg" NAME_WE)
add_custom_target(_fkie_multimaster_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fkie_multimaster_msgs" "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkState.msg" ""
)

get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg" NAME_WE)
add_custom_target(_fkie_multimaster_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fkie_multimaster_msgs" "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg" ""
)

get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg" NAME_WE)
add_custom_target(_fkie_multimaster_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fkie_multimaster_msgs" "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg" ""
)

get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/GetSyncInfo.srv" NAME_WE)
add_custom_target(_fkie_multimaster_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fkie_multimaster_msgs" "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/GetSyncInfo.srv" "fkie_multimaster_msgs/SyncServiceInfo:fkie_multimaster_msgs/SyncMasterInfo:fkie_multimaster_msgs/SyncTopicInfo"
)

get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncMasterInfo.msg" NAME_WE)
add_custom_target(_fkie_multimaster_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fkie_multimaster_msgs" "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncMasterInfo.msg" "fkie_multimaster_msgs/SyncServiceInfo:fkie_multimaster_msgs/SyncTopicInfo"
)

get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/Task.srv" NAME_WE)
add_custom_target(_fkie_multimaster_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fkie_multimaster_msgs" "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/Task.srv" ""
)

get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/MasterState.msg" NAME_WE)
add_custom_target(_fkie_multimaster_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fkie_multimaster_msgs" "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/MasterState.msg" "fkie_multimaster_msgs/ROSMaster"
)

get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg" NAME_WE)
add_custom_target(_fkie_multimaster_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fkie_multimaster_msgs" "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg" ""
)

get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/DiscoverMasters.srv" NAME_WE)
add_custom_target(_fkie_multimaster_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fkie_multimaster_msgs" "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/DiscoverMasters.srv" "fkie_multimaster_msgs/ROSMaster"
)

get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkStatesStamped.msg" NAME_WE)
add_custom_target(_fkie_multimaster_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fkie_multimaster_msgs" "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkStatesStamped.msg" "fkie_multimaster_msgs/LinkState:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_cpp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_cpp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_cpp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkStatesStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkState.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_cpp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/MasterState.msg"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_cpp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_cpp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncMasterInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg;/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fkie_multimaster_msgs
)

### Generating Services
_generate_srv_cpp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/GetSyncInfo.srv"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg;/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncMasterInfo.msg;/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_srv_cpp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/DiscoverMasters.srv"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_srv_cpp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/LoadLaunch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_srv_cpp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/Task.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fkie_multimaster_msgs
)

### Generating Module File
_generate_module_cpp(fkie_multimaster_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fkie_multimaster_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(fkie_multimaster_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(fkie_multimaster_msgs_generate_messages fkie_multimaster_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/LoadLaunch.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_cpp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkState.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_cpp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_cpp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_cpp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/GetSyncInfo.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_cpp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncMasterInfo.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_cpp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/Task.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_cpp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/MasterState.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_cpp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_cpp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/DiscoverMasters.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_cpp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkStatesStamped.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_cpp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fkie_multimaster_msgs_gencpp)
add_dependencies(fkie_multimaster_msgs_gencpp fkie_multimaster_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fkie_multimaster_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_eus(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_eus(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_eus(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkStatesStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkState.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_eus(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/MasterState.msg"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_eus(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_eus(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncMasterInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg;/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fkie_multimaster_msgs
)

### Generating Services
_generate_srv_eus(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/GetSyncInfo.srv"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg;/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncMasterInfo.msg;/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_srv_eus(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/DiscoverMasters.srv"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_srv_eus(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/LoadLaunch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_srv_eus(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/Task.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fkie_multimaster_msgs
)

### Generating Module File
_generate_module_eus(fkie_multimaster_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fkie_multimaster_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(fkie_multimaster_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(fkie_multimaster_msgs_generate_messages fkie_multimaster_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/LoadLaunch.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_eus _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkState.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_eus _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_eus _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_eus _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/GetSyncInfo.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_eus _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncMasterInfo.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_eus _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/Task.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_eus _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/MasterState.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_eus _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_eus _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/DiscoverMasters.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_eus _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkStatesStamped.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_eus _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fkie_multimaster_msgs_geneus)
add_dependencies(fkie_multimaster_msgs_geneus fkie_multimaster_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fkie_multimaster_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_lisp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_lisp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_lisp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkStatesStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkState.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_lisp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/MasterState.msg"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_lisp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_lisp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncMasterInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg;/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fkie_multimaster_msgs
)

### Generating Services
_generate_srv_lisp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/GetSyncInfo.srv"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg;/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncMasterInfo.msg;/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_srv_lisp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/DiscoverMasters.srv"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_srv_lisp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/LoadLaunch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_srv_lisp(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/Task.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fkie_multimaster_msgs
)

### Generating Module File
_generate_module_lisp(fkie_multimaster_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fkie_multimaster_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(fkie_multimaster_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(fkie_multimaster_msgs_generate_messages fkie_multimaster_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/LoadLaunch.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_lisp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkState.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_lisp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_lisp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_lisp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/GetSyncInfo.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_lisp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncMasterInfo.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_lisp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/Task.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_lisp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/MasterState.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_lisp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_lisp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/DiscoverMasters.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_lisp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkStatesStamped.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_lisp _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fkie_multimaster_msgs_genlisp)
add_dependencies(fkie_multimaster_msgs_genlisp fkie_multimaster_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fkie_multimaster_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_nodejs(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_nodejs(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_nodejs(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkStatesStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkState.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_nodejs(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/MasterState.msg"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_nodejs(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_nodejs(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncMasterInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg;/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fkie_multimaster_msgs
)

### Generating Services
_generate_srv_nodejs(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/GetSyncInfo.srv"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg;/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncMasterInfo.msg;/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_srv_nodejs(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/DiscoverMasters.srv"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_srv_nodejs(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/LoadLaunch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_srv_nodejs(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/Task.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fkie_multimaster_msgs
)

### Generating Module File
_generate_module_nodejs(fkie_multimaster_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fkie_multimaster_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(fkie_multimaster_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(fkie_multimaster_msgs_generate_messages fkie_multimaster_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/LoadLaunch.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_nodejs _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkState.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_nodejs _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_nodejs _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_nodejs _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/GetSyncInfo.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_nodejs _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncMasterInfo.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_nodejs _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/Task.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_nodejs _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/MasterState.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_nodejs _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_nodejs _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/DiscoverMasters.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_nodejs _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkStatesStamped.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_nodejs _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fkie_multimaster_msgs_gennodejs)
add_dependencies(fkie_multimaster_msgs_gennodejs fkie_multimaster_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fkie_multimaster_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_py(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_py(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_py(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkStatesStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkState.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_py(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/MasterState.msg"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_py(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_msg_py(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncMasterInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg;/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fkie_multimaster_msgs
)

### Generating Services
_generate_srv_py(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/GetSyncInfo.srv"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg;/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncMasterInfo.msg;/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_srv_py(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/DiscoverMasters.srv"
  "${MSG_I_FLAGS}"
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_srv_py(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/LoadLaunch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fkie_multimaster_msgs
)
_generate_srv_py(fkie_multimaster_msgs
  "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/Task.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fkie_multimaster_msgs
)

### Generating Module File
_generate_module_py(fkie_multimaster_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fkie_multimaster_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(fkie_multimaster_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(fkie_multimaster_msgs_generate_messages fkie_multimaster_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/LoadLaunch.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_py _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkState.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_py _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncServiceInfo.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_py _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncTopicInfo.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_py _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/GetSyncInfo.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_py _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/SyncMasterInfo.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_py _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/Task.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_py _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/MasterState.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_py _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/ROSMaster.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_py _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/srv/DiscoverMasters.srv" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_py _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/thomas/cours-de-robotique/src/multimaster/fkie_multimaster_msgs/msg/LinkStatesStamped.msg" NAME_WE)
add_dependencies(fkie_multimaster_msgs_generate_messages_py _fkie_multimaster_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fkie_multimaster_msgs_genpy)
add_dependencies(fkie_multimaster_msgs_genpy fkie_multimaster_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fkie_multimaster_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fkie_multimaster_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fkie_multimaster_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(fkie_multimaster_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fkie_multimaster_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fkie_multimaster_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(fkie_multimaster_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fkie_multimaster_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fkie_multimaster_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(fkie_multimaster_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fkie_multimaster_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fkie_multimaster_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(fkie_multimaster_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fkie_multimaster_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fkie_multimaster_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fkie_multimaster_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(fkie_multimaster_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
