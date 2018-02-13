#!/bin/bash

FILE=2018-02-alpha-9.tar.gz
LINK=latest.tar.gz

pushd ../../
    mv Downloads/*.tar.gz .
    rm $LINK
    ln $FILE $LINK
popd