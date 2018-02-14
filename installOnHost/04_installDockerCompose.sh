#!/bin/bash

echo try to install Docker-compose
# sudo groupadd $GRP
DOCKER_RELEASE=1.19.0
COMPOSE_PATH=/usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/$DOCKER_RELEASE/docker-compose-`uname -s`-`uname -m` -o $COMPOSE_PATH

sudo chmod +x $COMPOSE_PATH

docker-compose --version
