# Install script for directory: /home/thomas/cours-de-robotique/src/actionlib_tutorials

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/thomas/cours-de-robotique/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/action" TYPE FILE FILES
    "/home/thomas/cours-de-robotique/src/actionlib_tutorials/action/Fibonacci.action"
    "/home/thomas/cours-de-robotique/src/actionlib_tutorials/action/Averaging.action"
    "/home/thomas/cours-de-robotique/src/actionlib_tutorials/action/Machine.action"
    "/home/thomas/cours-de-robotique/src/actionlib_tutorials/action/Lidar.action"
    "/home/thomas/cours-de-robotique/src/actionlib_tutorials/action/MoveTo.action"
    "/home/thomas/cours-de-robotique/src/actionlib_tutorials/action/doTraj.action"
    "/home/thomas/cours-de-robotique/src/actionlib_tutorials/action/my_new.action"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/msg" TYPE FILE FILES
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/FibonacciAction.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/FibonacciActionGoal.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/FibonacciActionResult.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/FibonacciActionFeedback.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/FibonacciGoal.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/FibonacciResult.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/FibonacciFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/msg" TYPE FILE FILES
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/AveragingAction.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/AveragingActionGoal.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/AveragingActionResult.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/AveragingActionFeedback.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/AveragingGoal.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/AveragingResult.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/AveragingFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/msg" TYPE FILE FILES
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/MachineAction.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/MachineActionGoal.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/MachineActionResult.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/MachineActionFeedback.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/MachineGoal.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/MachineResult.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/MachineFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/msg" TYPE FILE FILES
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/LidarAction.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/LidarActionGoal.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/LidarActionResult.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/LidarActionFeedback.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/LidarGoal.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/LidarResult.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/LidarFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/msg" TYPE FILE FILES
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/MoveToAction.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/MoveToActionGoal.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/MoveToActionResult.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/MoveToActionFeedback.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/MoveToGoal.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/MoveToResult.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/MoveToFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/msg" TYPE FILE FILES
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/doTrajAction.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/doTrajActionGoal.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/doTrajActionResult.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/doTrajActionFeedback.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/doTrajGoal.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/doTrajResult.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/doTrajFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/msg" TYPE FILE FILES
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/my_newAction.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/my_newActionGoal.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/my_newActionResult.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/my_newActionFeedback.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/my_newGoal.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/my_newResult.msg"
    "/home/thomas/cours-de-robotique/devel/share/actionlib_tutorials/msg/my_newFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/srv" TYPE FILE FILES "/home/thomas/cours-de-robotique/src/actionlib_tutorials/srv/killMotors.srv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/cmake" TYPE FILE FILES "/home/thomas/cours-de-robotique/build/actionlib_tutorials/catkin_generated/installspace/actionlib_tutorials-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/thomas/cours-de-robotique/devel/include/actionlib_tutorials")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/thomas/cours-de-robotique/devel/share/roseus/ros/actionlib_tutorials")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/thomas/cours-de-robotique/devel/share/common-lisp/ros/actionlib_tutorials")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/thomas/cours-de-robotique/devel/share/gennodejs/ros/actionlib_tutorials")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/thomas/cours-de-robotique/devel/lib/python2.7/dist-packages/actionlib_tutorials")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/thomas/cours-de-robotique/devel/lib/python2.7/dist-packages/actionlib_tutorials")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/thomas/cours-de-robotique/build/actionlib_tutorials/catkin_generated/installspace/actionlib_tutorials.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/cmake" TYPE FILE FILES "/home/thomas/cours-de-robotique/build/actionlib_tutorials/catkin_generated/installspace/actionlib_tutorials-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/cmake" TYPE FILE FILES
    "/home/thomas/cours-de-robotique/build/actionlib_tutorials/catkin_generated/installspace/actionlib_tutorialsConfig.cmake"
    "/home/thomas/cours-de-robotique/build/actionlib_tutorials/catkin_generated/installspace/actionlib_tutorialsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials" TYPE FILE FILES "/home/thomas/cours-de-robotique/src/actionlib_tutorials/package.xml")
endif()

