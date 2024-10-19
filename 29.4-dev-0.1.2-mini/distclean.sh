#!/bin/sh
echo "------------------------"
echo " distclean"
echo "------------------------"

set -e
# Needed for GCC >= 14
export CFLAGS=-Wno-error=implicit-function-declaration
(cd ./src-29.4 && make distclean) &&
echo "distclean done."
