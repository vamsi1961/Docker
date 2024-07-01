FROM osrf/ros:foxy-desktop


RUN apt-get update && apt-get install -y \
    qt5-default \
    libxcb-xinerama0

RUN apt-get update && apt-get install -y git wget python3-pip vim
RUN pip3 install setuptools==58.2.0

RUN export XDG_RUNTIME_DIR=/run/user/$(id -u)
RUN mkdir -p /run/user/$(id -u)
RUN chmod 700 /run/user/$(id -u)

RUN apt-get upgrade -y

RUN export QT_QPA_PLATFORM=offscreen


CMD ["bash"]