#!/bin/bash

# some simple steps to install (the latest version of) docker-ce 
sudo apt-get update

sudo apt-get install  docker-ce

#the following is just a verification step to see if everything works
# it generates not much more than "Hello from Docker!"
# "This message shows that your installation appears to be working correctly."
sudo docker run hello-world
