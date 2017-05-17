#!/bin/bash

xhost local:root
docker run --privileged --rm -it \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       rpi_docker
