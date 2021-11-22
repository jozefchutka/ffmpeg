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
    build-fdk-aac
    build-lame
    build-libvpx
    build-libwebp
    build-ogg
    build-opus
    build-rubberband
    build-theora
    build-vorbis
    build-x264
    build-x265
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
