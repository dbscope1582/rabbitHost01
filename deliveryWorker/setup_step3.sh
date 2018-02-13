#!/bin/bash


pushd latest/portal
sudo make elastic-init-mapping
sudo make workers-start
popd
