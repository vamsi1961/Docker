

### ARG  argument name 

 argument name

    ARG VERSION=20.04


### FROM basimage

it defines the base image it start the build process

    FROM ubuntu:${VERSION}

FROM supports variable that are declared by any ARG instruction that occurs before the first FROM

### RUN command

central executing directive for the docker. It is used to run the commands using the docker file

    RUN apt-get update -y

### CMD command

executing a specific command within container.

run the bash in container

    CMD ["bash"]

### build
build the docker image.
when we build it docker. build command is run by docker deamon not CLI.

It first sends all data to docker deamon

    sudo docker build -t myimage .

build it from another directory

    sudo docker build -f location .

get containers are running

    sudo docker ps

get containers which are running and exited

    sudo docker ps -a

Run a container

    sudo docker run options image commands args

Run a container and give name

    sudo docker run name image commands args

RUN using rm flag
--rm flag causes docker remove automatically the container it already exists. This removes the container and re-run the container

    sudo docker run --rm -it image_id commands args


docker runs in 2 modes
1. attached mode or in the foreground
2. detached mode or in the background

By default docker runs in attached mode i.e it is attached to the terminal session where it displays the output and message

Run docker in interactive way

     sudo docker run --name container_name -it  imageid

Remove containers

    sudo docker rm container_id

stop the container

    sudo docker stop container_id

