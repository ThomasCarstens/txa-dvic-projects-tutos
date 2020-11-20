

"""Some theory.

Packages

"""
/*
Filesystem Level
  --- Stacks                | several packages with some functionality e.g. navigation stack.
                              (for code sharing)
         --- Stack Manifest | data about a stack
  --- Packages              | ROS "atoms": min structure/content to create a program
         --- Manifest       | info about package, license info, dependencies, compiler flags etc
                              (for installation and distribution purposes)
         --- Messages       | info between processes (describe data values)
                              (in different programming languages)
                              fields (type of data) and constants (name of fields)
         --- Services       | built upon msgs to define request and response data structures
                              (req/response communication between nodes)
         --- Code
         --- Others like
          ---Header         | contains timestamp, frame, etc.
                              (for numbering and recording messages)
*/

/*
Package contents
  --- bin/                  | folder where compiled+linked programs are stored.
  --- include/package_name/ | includes lib headers
  --- msg/                  | nonstandard msgs
  --- scripts/   [NONVITAL] | executable scripts (any language)
  --- src/       [NONVITAL] | any source file
  --- srv/       [NONVITAL] | services
  --- CMakeLists.txt/       | CMake Build file.
  --- manifest.xml          | package manifest file

*/

/*

Strongly advised to get up to date with
- rosbash package navigation tools...
- other ros package development tools.

*/


/*
ROS Computational Graph
  --- Nodes                | Processes where computation is done.
                             Ideally 1 functionality.
                             Built with ROS client lib (roscpp/rospy)
                             (useful for fault tolerance, simplifications)

  --- Master               | Name registration and lookup for rest of nodes.

  --- Parameter Server     | Centralized storage of data (using keys!)
                              (dynamic node configuration or setup)

  --- Messages             | .
  --- Topics               | When node sends data: publishing a topic.
                             (to separate production (publish to ~)
                             of consumption (subscribe to ~))
  --- Services             | When you need a request/answer from a node.
                            (node opens to interaction with all other nodes)
  --- Bag                  | format to record/playback ros data.
*/


""" Change node NAME """
$ rosrun file package topic1:=/level1/topic1

""" Change node PARAMETER """
$ rosrun file package _param:=9.0

/*
**Note**: some names reserved:
  --- __name               | keyword: NODE NAME
  --- __log                | keyword: Node log file location
  --- __ip                 | ROS_IP
  --- __hostname           | ROS_HOSTNAME
  --- __master             | ROS_MASTER_URI
  --- __ns                 | ROS_NAMESPACE
*/

""" Find topic BANDWIDTH """
$ rostopic bw /topic

""" Print msgs to screen """
$ rostopic echo /topic

""" Publish data to the topic """
$ rostopic pub /topic type args

/*
rossrv - information about service's data structure
rosservice - list and query services


The Parameter Server
Tool: rosparam
  --- rosparam list | set ~ value | get ~ | delete ~ | dump file | load file
*/
