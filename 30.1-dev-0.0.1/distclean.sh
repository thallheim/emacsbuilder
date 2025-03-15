#!/bin/sh
echo "------------------------"
echo " distclean"
echo "------------------------"

VERSION="30.1"

set -e
# Needed for GCC >= 14
export CFLAGS=-Wno-error=implicit-function-declaration
(cd ./src-$VERSION && make distclean) &&
echo "distclean done."
