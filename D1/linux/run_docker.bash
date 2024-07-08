# If not working, first do: sudo rm -rf /tmp/.docker.xauth
# It still not working, try running the script as root.
## Build the image first
### docker build -t r2_path_planning .
## then run this script

docker run -it --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --name ros2_container \
    foxy_inst:latest \
    bash

echo "Done."