FROM osrf/ros:foxy-desktop

LABEL maintainer="Vamsi Kishore"
LABEL version="0.1"

ENV ROS_DISTRO foxy


#install python and relevant python packages here
RUN apt-get update && \
	apt-get install -y curl gnupg lsb-release cmake git vim python3-pip python3-setuptools wget && \
	pip3 install numpy rdrive PySimpleGUI pymodbus pandas scikit-learn

#source the setup file and add it to bashrc so that you don't have to source each time you open a new terminal
RUN echo 'source "/opt/ros/$ROS_DISTRO/setup.bash"' >> ~/.bashrc

RUN sudo apt install python3-rosdep

# make sure packages are upto date
# Initialize rosdep
RUN if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then sudo rosdep init; fi


# Update rosdep
RUN rosdep update

# Update and upgrade system packages
RUN sudo apt update && sudo apt dist-upgrade -y

RUN	sudo apt dist-upgrade 
# RUN sudo apt remove cmake


# install the colcon with mixin
# Install the colcon with mixin
RUN sudo apt update && sudo apt install -y \
    python3-colcon-common-extensions \
    python3-colcon-mixin
# Install dependencies
RUN apt-get update && \
    apt-get install -y wget build-essential libssl-dev



# Remove old CMake version
RUN apt-get remove -y cmake

# Install dependencies for downloading and extracting CMake
RUN apt-get update && apt-get install -y wget tar

# Download and install CMake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.27.2/cmake-3.27.2-linux-x86_64.tar.gz && \
    tar -zxvf cmake-3.27.2-linux-x86_64.tar.gz -C /opt && \
    ln -s /opt/cmake-3.27.2-linux-x86_64/bin/cmake /usr/local/bin/cmake && \
    rm cmake-3.27.2-linux-x86_64.tar.gz

# Verify CMake installation
RUN cmake --version

# Continue with ROS installation
# Make sure to update the ROS repository and install necessary packages
# RUN apt-get update && apt-get install -y \
#     ros-humble-desktop-full \
#     # Add any other ROS packages you need
#     && rm -rf /var/lib/apt/lists/*

# Source the ROS setup.bash script
RUN echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc











# # Set the PATH environment variable
# ENV PATH="/opt/cmake-3.27.2-linux-x86_64/bin:${PATH}"

# # Add colcon mixin repository if it doesn't already exist
# RUN if ! colcon mixin list | grep -q 'default'; then colcon mixin add default https://raw.githubusercontent.com/colcon/colcon-mixin-repository/master/index.yaml; fi

# RUN colcon mixin update default

	
# # install vcstool

# RUN sudo apt install python3-vcstool

# WORKDIR /ws_moveit2/src
# # Move into your Colcon workspace and pull the MoveIt tutorials source:
	
# RUN git clone --branch humble https://github.com/ros-planning/moveit2_tutorials 

# RUN vcs import < moveit2_tutorials/moveit2_tutorials.repos

# #BUILD IT

# RUN sudo apt update && rosdep install -r --from-paths . --ignore-src --rosdistro $ROS_DISTRO -y

# WORKDIR /ws_moveit2
# # # The next command will configure your Colcon workspace:
# # # RUN cd ~/ws_moveit2 \
# RUN colcon build --mixin release --parallel-workers 1






# #source this workspace

# RUN source ~/ws_moveit2/install/setup.bash \
# echo 'source ~/ws_moveit2/install/setup.bash' >> ~/.bashrc

# # install the cyclone DDS
# RUN sudo apt install ros-humble-rmw-cyclonedds-cpp \
# # You may want to add this to ~/.bashrc to source it automatically
# export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp