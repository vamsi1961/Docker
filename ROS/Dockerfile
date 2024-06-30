ARG ROS_DISTRO=humble
 
########################################
# Base Image for TurtleBot3 Simulation #
########################################
FROM osrf/ros:${ROS_DISTRO}-desktop as base
ENV ROS_DISTRO=${ROS_DISTRO}
SHELL ["/bin/bash", "-c"]
 
# Create Colcon workspace with external dependencies
RUN mkdir -p /turtlebot3_ws/src
WORKDIR /turtlebot3_ws/src
COPY dependencies.repos .
RUN vcs import < dependencies.repos

# Use Cyclone DDS as middleware
RUN apt-get update && apt-get install -y --no-install-recommends \
 ros-${ROS_DISTRO}-rmw-cyclonedds-cpp
ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
 
# Build the base Colcon workspace, installing dependencies first.
WORKDIR /turtlebot3_ws
RUN source /opt/ros/${ROS_DISTRO}/setup.bash \
 && apt-get update -y \
 && rosdep install --from-paths src --ignore-src --rosdistro ${ROS_DISTRO} -y \
 && colcon build --symlink-install
ENV TURTLEBOT3_MODEL=waffle_pi