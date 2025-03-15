#!/bin/bash
echo "--------------------------------------------------"
echo " Install build dependencies"
echo "--------------------------------------------------"

### PLATFORM CHECK
#############################################
KERNEL_VERSION=$(uname -v)
KERNEL_NAME=$(uname -s)
PLATFORM_SUPPORTED=false
PLATFORM=
SUPPORTED=("Arch" "Debian" "MINGW64" "Ubuntu")

for distro in "${SUPPORTED[@]}"; do
    if [[ $KERNEL_VERSION == *"$distro"* || $KERNEL_NAME == *"$distro"* ]]; then
        PLATFORM_SUPPORTED=true
        PLATFORM=${distro}
        break
    fi
done

### Debian
#############################################
if [[ $PLATFORM == "Debian" ]]; then
    (sudo apt build-dep emacs && \
        sudo apt install -y libgccjit0 libgccjit-12-dev \
             gnutls-bin libtree-sitter-dev) && \
        echo "Dependencies installed"
fi

### MSYS2/mingw64
#############################################
if [[ $PLATFORM == "MINGW64" ]]; then
# MINIMAL
#    (pacman -Syu && pacman -S --needed \
#        autoconf \
#        automake \
#        base-devel \
#        git \
#        libcurl \
#        libgc \
#        mingw-w64-x86_64-gmp \
#        mingw-w64-x86_64-toolchain \
#        mingw-w64-x86_64-xpm-nox \
#        texinfo) && \
#        echo "Dependencies installed"

# FULL
(pacman -Syu && pacman -S --needed \
   autoconf \
   base-devel \
   automake \
   git \
   libcurl \
   libgc \
   libiconv \
   libintl \
   mingw-w64-x86_64-clang \
   mingw-w64-x86_64-llvm \
   mingw-w64-x86_64-fontconfig \
   mingw-w64-x86_64-freetype \
   mingw-w64-x86_64-binutils \
   mingw-w64-x86_64-bzip2 \
   mingw-w64-x86_64-toolchain \
   mingw-w64-x86_64-gmp \
   mingw-w64-x86_64-gnutls \
   mingw-w64-x86_64-libtiff \
   mingw-w64-x86_64-gdk-pixbuf2 \
   mingw-w64-x86_64-gettext \
   mingw-w64-x86_64-gtk3 \
   mingw-w64-x86_64-gtk-update-icon-cache \
   mingw-w64-x86_64-giflib \
   mingw-w64-x86_64-libpng \
   mingw-w64-x86_64-libjpeg-turbo \
   mingw-w64-x86_64-librsvg \
   mingw-w64-x86_64-libwebp \
   mingw-w64-x86_64-lcms2 \
   mingw-w64-x86_64-libxml2 \
   mingw-w64-x86_64-zlib \
   mingw-w64-x86_64-harfbuzz \
   mingw-w64-x86_64-libgccjit \
   mingw-w64-x86_64-sqlite3 \
   mingw-w64-x86_64-tree-sitter \
   mingw-w64-x86_64-winpthreads \
   mingw-w64-x86_64-xpm-nox \
   texinfo) && \
       echo "Dependencies installed"

fi

if [[ ! $$PLATFORM_SUPPORTED ]]; then
    echo "............................................................................."
    echo ":::: FATAL: Platform (maybe) unsupported                                    :"
    echo "¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨"
    echo "  Modify the script to match your system if you know it will work, and can"
    echo "  be bothered to. If not, go install the dependencies manually and then"
    echo "  proceed to config."
    exit 1
fi
