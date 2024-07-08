#!/usr/bin/env bash
set -x
echo "Starting ros refresher 2024 container"
xhost +
sudo docker rm refresh2024   #remove any already existing container with the same name
sudo docker run --cap-add=ALL --privileged --network host -v /dev:/dev -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd)/catkin_ws:/root/catkin_ws -e DISPLAY=unix$DISPLAY -v $HOME/.Xauthority:/root/.Xauthority -p 8080:80 --name refresh2024 -it ros_refresher2024 bash    #Run the ros_refresher2024 container with the name refresh2024