#!/bin/bash

DIR=latest
#ARCHIVE=2017-12-alpha-7.tar.gz
ARCHIVE=latest.tar.gz
echo $DIR
echo ARCHIVE: $ARCHIVE
# 20180122 change due to Nicolas' mail from 18.th BEGIN
if [ -d "$DIR" ]; then
    echo $DIR exists. it must be cleaned up first
    pushd $DIR
    if [ -d "portal" ]; then
	echo the subdirectory portal exists. call make down
	pushd portal
	make down
	popd
    fi
    popd
    sudo rm -rf $DIR
fi
# 20180122 END

docker rm -fv $(docker ps -aq)

docker ps

#20180122 commented sudo rm -rf $DIR
mkdir $DIR

pushd $DIR
tar xvf ../$ARCHIVE
cd portal
# 20180122 added the following line (not sure if it must be kept in here after one successful run
make pull-images #requires docker-compose >= 1.18.0
sudo make init
sudo make build
sudo make up
popd

echo =========== SCOPE
echo now call ./setup_step2.sh
echo the last call from setup.sh is sudo make up. Which typically waits not long enough. so
echo call ./setup_step2.sh until it succeeds
