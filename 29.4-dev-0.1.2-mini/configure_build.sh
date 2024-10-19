#!/bin/sh
echo "------------------------"
echo " Configure build"
echo "------------------------"

# Running under mingw64?
IS_MINGW64=
if [ -n $MSYSTEM ]; then
    IS_MINGW64=true
else
    IS_MINGW64=false
fi


# Needed for GCC >= 14
export CFLAGS=-Wno-error=implicit-function-declaration

if [ ! -d ./src-29.4 ]; then
    echo "No source dir - use local archive"
    if [ ! -a ./emacs-29.4.tar.gz ]; then
        echo "No archive in project root - curling from GNU ftp"
        curl https://ftp.gnu.org/gnu/emacs/emacs-29.4.tar.gz -o emacs-29.4.tar.gz
        (tar xf ./emacs-29.4.tar.gz && mv ./emacs-29.4 ./src-29.4)
    else
        (tar xf ./emacs-29.4.tar.gz && mv ./emacs-29.4 ./src-29.4)
    fi
    # echo "No source archive in project root - cloning into 'src-29.4'"
    # (git clone --single-branch --branch emacs-29 https://github.com/emacs-mirror/emacs.git --depth=1 ./src-29.4)
    if [ -d ./src-29.4 ]; then
        echo "Sources ready for autoconf"
    else
        echo "Uh-oh :("
        exit 1
    fi
fi

if [ ! -f ./src-29.4/configure ]; then
    echo "configure.sh not found - running autoconf"
    cd ./src-29.4
    (./autogen.sh && echo "autoconf done - continuing")
    cd ..
fi

if [ -f ./src-29.4/configure ]; then
    cd ./src-29.4
    ./configure \
        -C \
        --prefix="/c/Emacs/thall-29.4-dev-0.1.2-mini" \
        --without-compress-install \
        --without-cairo \
        --without-libsystemd \
        --without-dbus \
        --without-gif \
        --without-lcms2 \
        --without-mailutils \
        --without-pop \
        --without-selinux \
        --without-sound \
        --with-json \
        --with-native-compilation=aot \
        --with-pgtk \
        --with-tree-sitter \
        --with-wide-int \
        --enable-link-time-optimization && \
    echo "Config complete, ready to build."
    cd ..
fi
