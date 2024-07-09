#!/usr/bin/env bash
set -x
echo "Starting a humble container to get the techman ros driver working"
xhost +
sudo docker rm humble_techman_driver   #remove any already existing container with the same name
sudo docker run --cap-add=ALL --privileged --network host -v /dev:/dev -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd)/catkin_ws:/root/catkin_ws -e DISPLAY=unix$DISPLAY -v $HOME/.Xauthority:/root/.Xauthority -p 8080:80 --name humble_techman_driver -it humble_techman bash    #Run the ros_refresher2024 container with the name refresh2024