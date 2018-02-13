#!/bin/bash

GRP=docker
# create a group named "docker" and add scope ($USER)
sudo groupadd $GRP

# add the user scope to the docker group ($USER is the current user)
sudo usermod -aG docker $USER

echo  everything should be ready. log out and log in again
echo then docker run hello-world without sudo should work
