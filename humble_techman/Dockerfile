FROM osrf/ros:humble-desktop

LABEL maintainer="Vamsi Kishore"
LABEL version="0.1"

ENV ROS_DISTRO humble

# Install required packages
RUN sudo apt-get update && sudo apt-get install -y \
    curl gnupg lsb-release git vim python3-pip python3-setuptools wget \
    python3-rosdep \
	# apt-get upgrade -y \
    python3-colcon-common-extensions \
    python3-colcon-mixin \
    build-essential libssl-dev && \
    pip3 install numpy rdrive PySimpleGUI pymodbus pandas scikit-learn && \
    rm -rf /var/lib/apt/lists/*

# RUN sudo apt install ros-foxy-desktop
# # Source the ROS setup file and add it to bashrc
RUN echo 'source "/opt/ros/$ROS_DISTRO/setup.bash"' >> /etc/bash.bashrc

RUN sudo apt upgrade -y

RUN sudo apt install python3-rosdep

RUN sudo apt-get install ros-humble-ament-cmake


