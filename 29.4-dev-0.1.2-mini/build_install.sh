#!/bin/sh
echo "------------------------"
echo " Building"
echo "------------------------"

export CFLAGS=-Wno-error=implicit-function-declaration


if [ ! -f ./src-29.4/configure ]; then
    echo "configure.sh not found - aborting."
    exit -1
fi

if [ -f ./src-29.4/configure ]; then
    cd ./src-29.4
    time (make -j10 && make install -j10) && \
        echo "Job's a good'un (built and installed)"
    cd ..
fi
