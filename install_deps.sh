#!/bin/sh
echo "----------------------------"
echo " Install build dependencies"
echo "----------------------------"

sudo apt update && sudo apt install -y \
    autoconf \
    apt-transport-https \
    ca-certificates \
    curl \
    git \
    gnupg-agent \
    libgtk-3-dev \
    libncurses5-dev \
    libxpm-dev \
    libpng-dev \
    libjpeg-dev \
    libgif-dev \
    libgnutls28-dev \
    libwebkit2gtk-4.1-dev \
    make \
    texinfo \
    software-properties-common

sudo apt update && sudo apt install -y \
    gcc-12 libgccjit0 libgccjit-12-dev

sudo apt install -y \
    libjansson4 \
    libjansson-dev
