echo "--------------------"
echo "Configure build"
echo "--------------------"

pushd ./src

if [ ! -f configure ]; then
  echo "configure.sh not found - running autoconf"
  ./autogen.sh && \
  ./configure.sh \
  --with-native-compilation \
  --without-compress-install \
  --with-mailutils \
  --with-json \
  --enable-linktime-optimization \
  --with-x && \
  echo "Config complete, ready to build."
  fi
