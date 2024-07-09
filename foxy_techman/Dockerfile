FROM osrf/ros:foxy-desktop

LABEL maintainer="Vamsi Kishore"
LABEL version="0.1"

ENV ROS_DISTRO foxy

# Install required packages
RUN apt-get update && apt-get install -y \
    curl gnupg lsb-release git vim python3-pip python3-setuptools wget \
    python3-rosdep \
    python3-colcon-common-extensions \
    python3-colcon-mixin \
    build-essential libssl-dev && \
    pip3 install numpy rdrive PySimpleGUI pymodbus pandas scikit-learn && \
    rm -rf /var/lib/apt/lists/*

# RUN sudo apt install ros-foxy-desktop
# # Source the ROS setup file and add it to bashrc
RUN echo 'source "/opt/ros/$ROS_DISTRO/setup.bash"' >> /etc/bash.bashrc


RUN sudo apt install python3-rosdep


# # # # Initialize and update rosdep
RUN if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then sudo rosdep init; fi

RUN rosdep update


# # # Update and upgrade system packages
# RUN apt-get update && apt-get dist-upgrade -y
#     apt-get autoremove -y && \
#     apt-get clean

# # # Install the new version of CMake without removing the old one
# RUN wget https://github.com/Kitware/CMake/releases/download/v3.22.1/cmake-3.22.1-linux-x86_64.tar.gz && \
#     tar -zxvf cmake-3.22.1-linux-x86_64.tar.gz -C /opt && \
#     ln -sf /opt/cmake-3.22.1-linux-x86_64/bin/* /usr/local/bin/ && \
#     rm cmake-3.22.1-linux-x86_64.tar.gz

# Verify CMake installation
# RUN /usr/local/bin/cmake --version

# Ensure the environment is sourced correctly for further commands
# SHELL ["/bin/bash", "-c"]
RUN sudo apt install python3-vcstool


# Source ROS setup in current shell
# RUN source /opt/ros/$ROS_DISTRO/setup.bash

# Additional setup can go here

# Set the PATH environment variable
# ENV PATH="/opt/cmake-3.22.1-linux-x86_64/bin:${PATH}"


# Add colcon mixin repository if it doesn't already exist
RUN if ! colcon mixin list | grep -q 'default'; then colcon mixin add default https://raw.githubusercontent.com/colcon/colcon-mixin-repository/master/index.yaml; fi

RUN colcon mixin update default

# install vcstool

RUN sudo apt install python3-vcstool

WORKDIR /ws_moveit2/src
# Move into your Colcon workspace and pull the MoveIt tutorials source:
	
RUN git clone https://github.com/ros-planning/moveit2_tutorials.git -b foxy

RUN vcs import < moveit2_tutorials/moveit2_tutorials.repos

#BUILD IT

# RUN sudo rosdep install -r --from-paths . --ignore-src --rosdistro foxy -y
# WORKDIR /ws_moveit2
# The next command will configure your Colcon workspace:
# RUN cd ~/ws_moveit2 \


