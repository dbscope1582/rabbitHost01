#!/bin/bash

DIR=latest
#ARCHIVE=2017-12-alpha-7.tar.gz
ARCHIVE=latest.tar.gz
echo $DIR
echo ARCHIVE: $ARCHIVE
pushd ../..
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
    rm -rf $DIR
  fi
  # 20180122 END

  docker rm -fv $(docker ps -aq)

  docker ps

  #20180122 commented sudo rm -rf $DIR
  mkdir $DIR

  pushd $DIR
    tar xvf ../$ARCHIVE
    cd portal
    # a hack mabye sufficient to get rid of the need for the first sudo
    # sudo chmod a+w /tmp
    # 20180122 added the following line (not sure if it must be kept in here after one successful run
    sudo make prepare-host-for-es
    # not mentioned in the README.md
    make pull-images #requires docker-compose >= 1.18.0
    make init
 #   make build
    make up
  popd

  echo =========== SCOPE
  echo if the output contains the \(green\) line saying
  echo Le compt administrateur admin@naoned.fr est enregistré
  echo then proceed with ./setup_step3.sh
  echo
  echo else call as many times ./setup_step2.sh until you see the mentioned line
popd
