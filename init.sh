#!/bin/bash

cd ..
git clone https://github.com/emscripten-core/emsdk.git
git clone git@github.com:jozefchutka/ffmpeg.wasm-core.git
cd ffmpeg.wasm-core
git checkout yscene
git submodule update --init --recursive
