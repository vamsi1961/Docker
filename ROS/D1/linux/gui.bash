FROM osrf/ros:humble-desktop-full

RUN apt-get update && apt-get install -y git wget python3-pip vim
RUN pip3 install setuptools==58.2.0

RUN git clone https://github.com/divyanshuraj6815/experiments.git

ENV DISPLAY=novnc:0.0