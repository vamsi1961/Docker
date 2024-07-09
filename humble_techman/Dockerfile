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

# Initialize and update rosdep
RUN if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then sudo rosdep init; fi

RUN rosdep update


RUN sudo apt install python3-vcstool


# Source ROS setup in current shell
# RUN source /opt/ros/$ROS_DISTRO/setup.bash


# Add colcon mixin repository if it doesn't already exist
RUN if ! colcon mixin list | grep -q 'default'; then colcon mixin add default https://raw.githubusercontent.com/colcon/colcon-mixin-repository/master/index.yaml; fi

RUN colcon mixin update default

# install vcstool

RUN sudo apt install python3-vcstool

WORKDIR /ws_moveit2/src
# Move into your Colcon workspace and pull the MoveIt tutorials source:
	
RUN git clone --branch humble https://github.com/ros-planning/moveit2_tutorials

RUN vcs import < moveit2_tutorials/moveit2_tutorials.repos

# BUILD IT

RUN sudo apt update && rosdep install -r --from-paths . --ignore-src --rosdistro $ROS_DISTRO -y
WORKDIR /ws_moveit2
RUN /bin/bash -c "source /opt/ros/humble/setup.bash && colcon build --mixin release --parallel-workers 1"

# RUN colcon build --mixin release --parallel-workers 1


