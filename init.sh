#!/bin/bash

cd ..
git clone https://github.com/emscripten-core/emsdk.git
git clone git@github.com:jozefchutka/ffmpeg.wasm-core.git

sudo -s
cd ../emsdk
./emsdk install 2.0.23
./emsdk activate 2.0.23
source ./emsdk_env.sh

cd ../ffmpeg.wasm-core
git checkout yscene
git submodule update --init --recursive
