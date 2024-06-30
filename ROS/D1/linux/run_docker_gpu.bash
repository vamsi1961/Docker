# Build the Docker image
docker build -t r2_path_planning .

# Allow local connections to X server
xhost +local:root

# Set XAUTH file
XAUTH=/tmp/.docker.xauth

# Ensure the XAUTH file exists
touch $XAUTH

# Generate XAUTH entry
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

# Run Docker container with the necessary environment variables and volume mounts
docker run -it \
    --name=r2_pathplanning_container \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --net=host \
    --privileged \
    --runtime=nvidia \
    osrf/ros:foxy-desktop \
    bash

# Cleanup
echo "Done."

# source /opt/ros/foxy/setup.bash
# ros2 run turtlesim turtlesim_node 