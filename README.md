# Docker-Install

## what is docker

Docker is an open-source projrct that automates the deployemeny of applications inside software containers, by providing an additional layer of abstraction and automation of operating system-level virtualization on Linux

It provides a uniform wrapper around a software package, this wrapper is called docker container which we can ship or build and inside these containers we can run any app anywhere

These are similar to shipping containers. The container is always same regardless the container size 

When we want to run the application in my sytem in another system we should check the packages and library version. we can use the docker container without worrying about all the dependencies or the environment setup which your software depends upon

## Docker vs Virtual machine

Both have similar resources but work differently
Containers virtualized the OS instead of hardware and containers are more portable

Each VM have full copy of virtual system that's why they are slow

Containers are an abstraction on the app layer that packages the code and dependencies

Multiple containers can run on same machine and share the same OS kernel but each container runs as isolated process in the user space as a result container takes less space than VM and usually container images typically take tens of MB in comparision of VM. 


## what is docker container

Docker container is a standard unit of software that packages up code and all its dependencies so the application, runs quickly and reliably from one computing environment to another environment.

When you create a docker container, which is essentially a unit of your software it can run everywhere regardless of the kernel version regardless of the host distro, the only condition is that the container and host architecture should match


## what is docker image

A container image is a lightweight, stand-alone, executable package of a piece of software that includes everything needed to run the application that is code your runtime your system tools and the system libraries  and the settings so the container images become container in runtime when the run on docker engine.

Docker image is not a virtual hard disk or VHD it's not a file system. It uses union file system and it's only a read-only layer also the docker image doesn't have any state so when your dicker images runs as docker container inside the docker engine and when you stop these running containers these images will not have or will not save any state so they are stateless.

Image is a tar file which has a hierarchy and an arbitrary depth and that's how it fits into your docker registry


Docker images are the basis of containers. They are the blueprint from which containers are created. Images.
Images are the basis of containers. They are the blueprint from which containers are created. Images include everything

## How does docker work

You can build docker images that hold your applications.

You can create Docker containers from those Docker images to run your applications.

You can share those docker images via Docker Hub or your own registry.

Dockerfile => Image => Container

### Dockerfile

we can build your applications into docker images so what happens is you pull some images which are already there on dockerhub, we use those images with your application and you write all that code or that script inside your dockerfile.


docker can build images automatically by reading the instructions from docker file.

It is a text document containing all comands a user can call on the command line to assemble an image

search docker images

    docker search <image you want from your docker hub>

pull an docker image

    docker pull <image>


## DOCKER HUB

It is a service provider for finding and sharing your container images with your teams or with the general public.

pull docker images to docker hub
1. tag
    sudo docker tag image kishore1961/image:version (1.0.0)

2. push
    sudo docker push kishore1961/image:1.0.0


