#!/bin/sh
echo "------------------------"
echo " Configure build"
echo "------------------------"

VERSION="30.1"
THALL_VERSION_SUFFIX="-dev-0.1.0"

# Running under mingw64?
IS_MINGW64=
if [ -n $MSYSTEM ]; then
    IS_MINGW64=true
else
    IS_MINGW64=false
fi


# Needed for GCC >= 14
export CFLAGS=-Wno-error=implicit-function-declaration

if [ ! -d ./src-$VERSION ]; then
    echo "No source dir - use local archive"
    if [ ! -a ./emacs-$VERSION.tar.gz ]; then
        echo "No archive in project root - curling from GNU ftp"
        curl https://ftp.gnu.org/gnu/emacs/emacs-$VERSION.tar.gz -o emacs-$VERSION.tar.gz
        (tar xf ./emacs-$VERSION.tar.gz && mv ./emacs-$VERSION ./src-$VERSION)
    else
        (tar xf ./emacs-$VERSION.tar.gz && mv ./emacs-$VERSION ./src-$VERSION)
    fi
    # echo "No source archive in project root - cloning into 'src-$VERSION'"
    # (git clone --single-branch --branch emacs-30 https://github.com/emacs-mirror/emacs.git --depth=1 ./src-$VERSION)
    if [ -d ./src-$VERSION ]; then
        echo "Sources ready for autoconf"
    else
        echo "Uh-oh :("
        exit 1
    fi
fi

if [ ! -f ./src-$VERSION/configure ]; then
    echo "configure.sh not found - running autoconf"
    cd ./src-$VERSION
    (./autogen.sh && echo "autoconf done - continuing")
    cd ..
fi

if [ -f ./src-$VERSION/configure ]; then
    cd ./src-$VERSION
    ./configure \
        -C \
        --prefix="/c/Emacs/thall-$VERSION$THALL_VERSION_SUFFIX" \
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
        --with-pgtk \
        --with-tree-sitter \
        --with-wide-int \
        --enable-link-time-optimization \
        --disable-gc-mark-trace && \
    echo "Config complete, ready to build."
    cd ..
fi
