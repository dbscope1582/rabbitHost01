#!/bin/bash


pushd ../../latest/portal
make elastic-init-mapping
make workers-start
popd
