# Docker-Install

ROS Installation in docker

create a folder of any name it is better to keep name of container name
 let's say => laugh
 
 mkdir laugh
 cd laugh
 

 
 # Create a new Dockerfile in the directory using a text editor. For example:
 nano Dockerfile
 
 
# In the Dockerfile, add the following code to specify the base image, update the package list, and install ROS Noetic:

"""
FROM ubuntu:20.04

# Install ROS Noetic
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-get update && apt-get install -y \
    ros-noetic-desktop-full

# Set up environment
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# Start a shell by default
CMD ["/bin/bash"]


"""

# to source the container 
source ~/.bashrc


# Save and close the Dockerfile.

# Build the Docker image using the following command:

docker build -t my_ros_image . 

# name can be any here it is my_rps_image

# Create a docker container

docker run -it --name my_ros_container my_ros_image

# "my_ros_container" is the name of container
# "my_ros_image" is the image name
# -it option allows you to interact with the container using a terminal


# Open a new terminal window and start a new bash session inside the container:

docker exec -it my_ros_container bash



# docker change name of cntainer
docker rename CONTAINER NEW_NAME

# docker change container image 
docker tag OldName:tag NewName:tag


List docker containers
        docker ps -a

Method 1

directory for your docker container

create a directory

    mkdir my_ros_container
    
    
# copy folder from local machine to docker

docker cp ~/Desktop/manipulator-flask man_flask:/root/catkin_ws/src


docker cp local_machine_location  container_name:location in docker





