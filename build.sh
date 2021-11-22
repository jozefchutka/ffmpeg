#!/bin/bash

set -eo pipefail

SCRIPT_ROOT=$(dirname $0)/wasm/build-scripts

run() {
  for name in $@; do
    $SCRIPT_ROOT/$name.sh
  done
}

run-all() {
  SCRIPTS=(
    # install dependencies
    install-deps
    build-zlib
    build-x264
    build-x265
    build-libvpx
    build-lame
    build-fdk-aac
    build-ogg
    build-vorbis
    build-theora
    build-opus
    build-libwebp
    build-librubberband
    configure-ffmpeg
    build-ffmpeg
  )
  run ${SCRIPTS[@]}
}

main() {
  # verify Emscripten version
  emcc -v
  if [[ "$@" == "" ]]; then
    run-all
  else
    run "$@"
  fi
}

main "$@"
