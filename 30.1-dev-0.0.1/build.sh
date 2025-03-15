#!/bin/sh
echo "------------------------"
echo " Building"
echo "------------------------"

VERSION="30.1"

export CFLAGS=-Wno-error=implicit-function-declaration

if [ ! -f ./src-$VERSION/configure ]; then
    echo "configure.sh not found - aborting."
    exit -1
fi

if [ -f ./src-$VERSION/configure ]; then
    cd ./src-$VERSION
    (time make -j16) && \
        echo "Job's a good'un - ready to install"
    cd ..
fi
