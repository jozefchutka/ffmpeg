#!/bin/bash

sudo -s
cd ../emsdk
./emsdk install 2.0.20
./emsdk activate 2.0.20
source ./emsdk_env.sh

cd ../ffmpeg.wasm-core
./build.sh