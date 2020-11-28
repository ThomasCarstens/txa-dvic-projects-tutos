execute_process(COMMAND "/home/thomas/cours-de-robotique/build/multimaster/fkie_master_discovery/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/thomas/cours-de-robotique/build/multimaster/fkie_master_discovery/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
