#!/bin/sh
echo "------------------"
echo " Configure build"
echo "------------------"

cd ./src

if [ ! -f configure ]; then
  echo "configure.sh not found - running autoconf"
  ./autogen.sh
fi

if [ -f configure ]; then
  ./configure.sh \
  --with-native-compilation \
  --without-compress-install \
  --with-mailutils \
  --with-json \
  --enable-linktime-optimization \
  --with-x && \
  echo "Config complete, ready to build."
fi

cd ../
