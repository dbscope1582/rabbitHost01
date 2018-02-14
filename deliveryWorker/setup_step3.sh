#!/bin/bash


pushd ../../latest/portal
  make elastic-init-mapping
  #  make workers-start
  make workers-configuration
  make workers-start
popd

echo =======================================================================
echo CAUTION
echo =======================================================================
echo The script called
echo make workers-start
echo as a final step. currently I am not really sure if this is correct of if
echo the script should wait some moments before doing it in order to give some
echo other porcesses \(e.g. rabbitMQ or elasticsearch\) a chance to completely boot
