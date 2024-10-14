#!/bin/sh
echo "-------------------"
echo "Install build deps"
echo "-------------------"

sudo apt update && sudo apt install -y \
    autoconf \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
    
sudo apt update && sudo apt install -y \
    gcc-12 libgccjit0 libgccjit-12-dev
    
sudo apt install -y \
    libjansson4 libjansson-dev
