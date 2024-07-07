FROM ros:noetic-robot

LABEL maintainer="Hari Prasanth"
LABEL version="0.1"

ENV ROS_DISTRO noetic


#install python and relevant python packages here
RUN apt-get update && \
	apt-get install -y curl gnupg lsb-release cmake git vim python3-pip python3-setuptools wget && \
	pip3 install numpy rdrive PySimpleGUI pymodbus pandas scikit-learn

#source the setup file and add it to bashrc so that you don't have to source each time you open a new terminal
RUN echo 'source "/opt/ros/$ROS_DISTRO/setup.bash"' >> ~/.bashrc

#For the keyboard configuration and so on
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration && \
	echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list && \
	apt-get install -y curl && \
	wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc && \
	apt-key add ros.asc && \
	apt-get update && \
	apt-get install -y ros-${ROS_DISTRO}-desktop-full liburdfdom-tools net-tools python3-wstool python3-osrf-pycommon apt-utils libcanberra-gtk-module libcanberra-gtk3-module openjdk-8-jdk python2 python-is-python2 iputils-ping && \
	echo 'export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")' >> ~/.bashrc	

#install the ros-rutorials package
RUN apt-get update && \
    apt-get install -y ros-$ROS_DISTRO-ros-tutorials && \
    apt-get install -y ros-$ROS_DISTRO-rqt && \
    apt-get install -y ros-$ROS_DISTRO-rqt-common-plugins && \
	apt-get install -y ros-$ROS_DISTRO-rqt ros-$ROS_DISTRO-rqt-common-plugins ros-$ROS_DISTRO-turtlesim 

#TF2
RUN	apt-get install -y ros-${ROS_DISTRO}-turtle-tf2 ros-${ROS_DISTRO}-tf2-tools ros-${ROS_DISTRO}-tf && \
	apt-get install -y evince