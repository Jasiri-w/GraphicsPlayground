#!/bin/bash

echo "Starting setup for OpenGL Development Environment..."

# Update the package list and install dependencies
sudo apt update && sudo apt install -y \
    build-essential \
    cmake \
    git \
    pkg-config \
    libglfw3 \
    libglfw3-dev \
    libglew-dev \
    mesa-utils \
    xorg-dev \
    libglm-dev \
    libxrandr-dev \
    libxi-dev \
    libxinerama-dev \
    libxcursor-dev \
    libxxf86vm-dev

# Install GLAD
echo "Installing GLAD..."
git clone https://github.com/Dav1dde/glad.git /tmp/glad
cd /tmp/glad
cmake -B build
cmake --build build
sudo cp include/glad/glad.h /usr/include/
sudo cp src/glad.c /usr/src/
sudo cp build/glad/libglad.a /usr/lib/
rm -rf /tmp/glad

# Verify OpenGL setup
echo "Verifying OpenGL setup..."
glxinfo | grep "OpenGL"

echo "Setup complete. You're ready to develop with OpenGL!"
