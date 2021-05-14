# Build

## Google Cloud

Build using google cloud console ([init.sh](https://github.com/jozefchutka/ffmpeg.wasm-core/blob/yscene/init.sh):

```
./init.sh
./build.sh
```

Emscripten part (from build.sh):

```
./wasm/build-scripts/configure-ffmpeg.sh
./wasm/build-scripts/build-ffmpeg.sh
```

| Machine            | Settings      | deps + libs | emconfigure | emcc   |
| ------------------ | ------------- | ----------: | ----------: | -----: |
| Google Cloud Shell | default (-O3) |      23 min |      10 min | 10 min |
| Google Cloud Shell | default (-O3) |             |             |  2 min |
| Google Cloud Shell | default (-O0) |      12 min |       2 min |  7 min |

