#!/bin/sh
echo "-----------------------------------"
echo " Install build dependencies"
echo "-----------------------------------"

# MINIMAL
# pacman -Syu && pacman -S --needed \
#   autoconf \
#   automake \
#   base-devel \
#   git \
#   libcurl \
#   libgc \
#   mingw-w64-x86_64-gmp \
#   mingw-w64-x86_64-toolchain
#   mingw-w64-x86_64-xpm-nox \
#   texinfo

# FULL
pacman -Syu && pacman -S --needed \
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
  mingw-w64-x86_64-jansson \
  mingw-w64-x86_64-libxml2 \
  mingw-w64-x86_64-zlib \
  mingw-w64-x86_64-harfbuzz \
  mingw-w64-x86_64-libgccjit \
  mingw-w64-x86_64-sqlite3 \
  mingw-w64-x86_64-tree-sitter \
  mingw-w64-x86_64-winpthreads \
  mingw-w64-x86_64-xpm-nox \
  texinfo
