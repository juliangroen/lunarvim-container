#!/usr/bin/env bash
# Run lunarvim docker container with the present working directory mounted to the app folder in the container user home folder
docker run -it --rm -v "${PWD}":/home/lunarvim/app lunarvim
