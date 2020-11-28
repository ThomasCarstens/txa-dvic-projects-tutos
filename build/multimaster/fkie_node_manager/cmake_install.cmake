# Install script for directory: /home/thomas/cours-de-robotique/src/multimaster/fkie_node_manager

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
  include("/home/thomas/cours-de-robotique/build/multimaster/fkie_node_manager/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/thomas/cours-de-robotique/build/multimaster/fkie_node_manager/catkin_generated/installspace/fkie_node_manager.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/fkie_node_manager/cmake" TYPE FILE FILES
    "/home/thomas/cours-de-robotique/build/multimaster/fkie_node_manager/catkin_generated/installspace/fkie_node_managerConfig.cmake"
    "/home/thomas/cours-de-robotique/build/multimaster/fkie_node_manager/catkin_generated/installspace/fkie_node_managerConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/fkie_node_manager" TYPE FILE FILES "/home/thomas/cours-de-robotique/src/multimaster/fkie_node_manager/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/fkie_node_manager" TYPE PROGRAM FILES "/home/thomas/cours-de-robotique/build/multimaster/fkie_node_manager/catkin_generated/installspace/dynamic_reconfigure")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/fkie_node_manager" TYPE PROGRAM FILES "/home/thomas/cours-de-robotique/build/multimaster/fkie_node_manager/catkin_generated/installspace/node_manager")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/fkie_node_manager" TYPE PROGRAM FILES "/home/thomas/cours-de-robotique/build/multimaster/fkie_node_manager/catkin_generated/installspace/script_runner.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/fkie_node_manager" TYPE PROGRAM FILES "/home/thomas/cours-de-robotique/build/multimaster/fkie_node_manager/catkin_generated/installspace/reduced_nm.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/fkie_node_manager" TYPE PROGRAM FILES "/home/thomas/cours-de-robotique/build/multimaster/fkie_node_manager/catkin_generated/installspace/remote_nm.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/fkie_node_manager" TYPE PROGRAM FILES "/home/thomas/cours-de-robotique/src/multimaster/fkie_node_manager/scripts/respawn")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/fkie_node_manager" TYPE FILE FILES
    "/home/thomas/cours-de-robotique/src/multimaster/fkie_node_manager/README.rst"
    "/home/thomas/cours-de-robotique/src/multimaster/fkie_node_manager/plugin.xml"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/fkie_node_manager" TYPE DIRECTORY FILES
    "/home/thomas/cours-de-robotique/src/multimaster/fkie_node_manager/doc"
    "/home/thomas/cours-de-robotique/src/multimaster/fkie_node_manager/images"
    "/home/thomas/cours-de-robotique/src/multimaster/fkie_node_manager/launch"
    "/home/thomas/cours-de-robotique/src/multimaster/fkie_node_manager/rqt_icons"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/fkie_node_manager" TYPE DIRECTORY FILES
    "/home/thomas/cours-de-robotique/src/multimaster/fkie_node_manager/src/fkie_node_manager/icons"
    "/home/thomas/cours-de-robotique/src/multimaster/fkie_node_manager/src/fkie_node_manager/ui"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/fkie_node_manager" TYPE FILE FILES
    "/home/thomas/cours-de-robotique/devel/share/fkie_node_manager/VERSION"
    "/home/thomas/cours-de-robotique/devel/share/fkie_node_manager/DATE"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  set(NODE_MANAGER_LAUNCHER "/home/thomas/cours-de-robotique/devel/share/fkie_node_manager/node_manager.desktop")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/thomas/cours-de-robotique/src/multimaster/fkie_node_manager/cmake/install_launcher.cmake")
endif()

