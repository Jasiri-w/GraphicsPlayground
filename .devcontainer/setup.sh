#!/bin/bash

# Update and install dependencies
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

# Clone and build GLAD
git clone https://github.com/Dav1dde/glad.git /tmp/glad
cd /tmp/glad
cmake -B build
cmake --build build
sudo cp build/glad/glad.h /usr/include/
sudo cp build/glad/libglad.a /usr/lib/

# Clean up
rm -rf /tmp/glad

echo "Setup complete!"
