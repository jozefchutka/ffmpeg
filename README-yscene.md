# Fetch & Merge

## ffmpeg.wasm-core

1. checkout yscene git
2. TortoiseGit -> Git Sync...
3. manage origins and add "wasm" origin
4. create branch "new-wasm" based on wasm/n4.3.1-wasm, TRACKed!, switch
5. pull latest into new-wasm
6. create branch "new-yscene" based on origin/yscene, TRACKed!, switch
7. pull latest into new-yscene
8. merge from new-wasm into new-yscene (expected conflicts)
9. TortoiseGit -> Git Commit -> new-yscene
10. resolve conflicts
11. TortoiseGit -> Browser references / new-yscene -> Select Tracked Branch -> origin/new-yscene
12. push new-yscene

## ffmpeg

1. checkout yscene git
2. TortoiseGit -> Git Sync...
3. manage origins and add "ffmpeg" origin (include tags), fetch remote branches (`git fetch -v --progress "ffmpeg"`)
4. create branch "new-ffmpeg" based on remotes/ffmpeg/???, TRACKed!, switch
5. pull latest into new-ffmpeg
6. create branch "new-yscene" based on origin/yscene, TRACKed!, switch
7. pull latest into new-yscene (`git pull --progress -v --no-rebase "origin" yscene`)
8. merge from new-ffmpeg into new-yscene (expected conflicts) (`git merge new-ffmpeg
`)
9. TortoiseGit -> Git Commit -> new-yscene
10. resolve conflicts
11. TortoiseGit -> Browser references / new-yscene -> Select Tracked Branch -> origin/new-yscene
12. push new-yscene

# Build

## Init

```
git clone https://github.com/emscripten-core/emsdk.git

git clone git@github.com:jozefchutka/ffmpeg.wasm-core.git
cd /home/jozefchutka/ffmpeg.wasm-core
git checkout yscene
git submodule update --init --recursive
```

## Compile

```
sudo -s

cd /home/jozefchutka/emsdk
./emsdk install 2.0.29
./emsdk activate 2.0.29
source ./emsdk_env.sh

cd /home/jozefchutka/ffmpeg.wasm-core
./build.sh
```

Artefacts appears in `/wasm/packages/core/dist`

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

