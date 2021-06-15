# Build

## Google Cloud

Build using google cloud console ([init.sh](https://github.com/jozefchutka/ffmpeg.wasm-core/blob/yscene/init.sh):

### Init

```
git clone https://github.com/emscripten-core/emsdk.git

git clone git@github.com:jozefchutka/ffmpeg.wasm-core.git
cd /home/jozefchutka/ffmpeg.wasm-core
git checkout yscene
git submodule update --init --recursive
```

### Compile

```
sudo -s

cd /home/jozefchutka/emsdk
./emsdk install 2.0.24
./emsdk activate 2.0.24
source ./emsdk_env.sh

cd /home/jozefchutka/ffmpeg.wasm-core
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

