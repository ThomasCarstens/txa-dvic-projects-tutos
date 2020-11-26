# Install script for directory: /home/berenice/Documents/txa-dvic-projects-tutos/src/actionlib_tutorials

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/berenice/Documents/txa-dvic-projects-tutos/install")
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

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/action" TYPE FILE FILES
    "/home/berenice/Documents/txa-dvic-projects-tutos/src/actionlib_tutorials/action/Fibonacci.action"
    "/home/berenice/Documents/txa-dvic-projects-tutos/src/actionlib_tutorials/action/Averaging.action"
    "/home/berenice/Documents/txa-dvic-projects-tutos/src/actionlib_tutorials/action/Machine.action"
    "/home/berenice/Documents/txa-dvic-projects-tutos/src/actionlib_tutorials/action/Lidar.action"
    "/home/berenice/Documents/txa-dvic-projects-tutos/src/actionlib_tutorials/action/MoveTo.action"
    "/home/berenice/Documents/txa-dvic-projects-tutos/src/actionlib_tutorials/action/doTraj.action"
    "/home/berenice/Documents/txa-dvic-projects-tutos/src/actionlib_tutorials/action/my_new.action"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/msg" TYPE FILE FILES
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/FibonacciAction.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/FibonacciActionGoal.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/FibonacciActionResult.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/FibonacciActionFeedback.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/FibonacciGoal.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/FibonacciResult.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/FibonacciFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/msg" TYPE FILE FILES
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/AveragingAction.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/AveragingActionGoal.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/AveragingActionResult.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/AveragingActionFeedback.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/AveragingGoal.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/AveragingResult.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/AveragingFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/msg" TYPE FILE FILES
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/MachineAction.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/MachineActionGoal.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/MachineActionResult.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/MachineActionFeedback.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/MachineGoal.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/MachineResult.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/MachineFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/msg" TYPE FILE FILES
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/LidarAction.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/LidarActionGoal.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/LidarActionResult.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/LidarActionFeedback.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/LidarGoal.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/LidarResult.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/LidarFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/msg" TYPE FILE FILES
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/MoveToAction.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/MoveToActionGoal.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/MoveToActionResult.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/MoveToActionFeedback.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/MoveToGoal.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/MoveToResult.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/MoveToFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/msg" TYPE FILE FILES
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/doTrajAction.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/doTrajActionGoal.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/doTrajActionResult.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/doTrajActionFeedback.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/doTrajGoal.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/doTrajResult.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/doTrajFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/msg" TYPE FILE FILES
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/my_newAction.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/my_newActionGoal.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/my_newActionResult.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/my_newActionFeedback.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/my_newGoal.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/my_newResult.msg"
    "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/actionlib_tutorials/msg/my_newFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/srv" TYPE FILE FILES "/home/berenice/Documents/txa-dvic-projects-tutos/src/actionlib_tutorials/srv/killMotors.srv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/cmake" TYPE FILE FILES "/home/berenice/Documents/txa-dvic-projects-tutos/build/actionlib_tutorials/catkin_generated/installspace/actionlib_tutorials-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/berenice/Documents/txa-dvic-projects-tutos/devel/include/actionlib_tutorials")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/roseus/ros/actionlib_tutorials")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/common-lisp/ros/actionlib_tutorials")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/berenice/Documents/txa-dvic-projects-tutos/devel/share/gennodejs/ros/actionlib_tutorials")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/berenice/Documents/txa-dvic-projects-tutos/devel/lib/python2.7/dist-packages/actionlib_tutorials")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/berenice/Documents/txa-dvic-projects-tutos/devel/lib/python2.7/dist-packages/actionlib_tutorials")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/berenice/Documents/txa-dvic-projects-tutos/build/actionlib_tutorials/catkin_generated/installspace/actionlib_tutorials.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/cmake" TYPE FILE FILES "/home/berenice/Documents/txa-dvic-projects-tutos/build/actionlib_tutorials/catkin_generated/installspace/actionlib_tutorials-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials/cmake" TYPE FILE FILES
    "/home/berenice/Documents/txa-dvic-projects-tutos/build/actionlib_tutorials/catkin_generated/installspace/actionlib_tutorialsConfig.cmake"
    "/home/berenice/Documents/txa-dvic-projects-tutos/build/actionlib_tutorials/catkin_generated/installspace/actionlib_tutorialsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib_tutorials" TYPE FILE FILES "/home/berenice/Documents/txa-dvic-projects-tutos/src/actionlib_tutorials/package.xml")
endif()

