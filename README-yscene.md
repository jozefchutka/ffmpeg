# Update

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
```

## Clean 

```
sudo -s
cd /home/jozefchutka/ffmpeg.wasm-core
emmake make clean
rm -rf build
rm -rf third_party
git submodule sync --recursive
git submodule update --init --recursive --remote
```

## Compile

```
sudo -s

apt-get install -y autogen
cd /home/jozefchutka/emsdk
git pull
./emsdk install 2.0.34
./emsdk activate 2.0.34
source ./emsdk_env.sh

cd /home/jozefchutka/ffmpeg.wasm-core
./build.sh
```

Emscripten part (from build.sh):

```
./wasm/build-scripts/build-rubberband.sh  # i.e.
./wasm/build-scripts/configure-ffmpeg.sh
./wasm/build-scripts/build-ffmpeg.sh
```

| Machine            | Version        | Settings      | deps + libs | emconfigure | emcc   |
| ------------------ | -------------- | ------------- | ----------: | ----------: | -----: |
| Google Cloud Shell | 4.4 light      | default (-O3) |      18 min |      10 min |  3 min |
| Google Cloud Shell | 4.4 rubberband | default (-O3) |     ~30 min |      6? min |  3 min |
| Google Cloud Shell | 4.4            | default (-O3) |      22 min |      13 min |  6 min |
| Google Cloud Shell | 4.3?           | default (-O3) |      23 min |      10 min | 10 min |
| Google Cloud Shell | 4.3?           | default (-O3) |             |             |  2 min |
| Google Cloud Shell | 4.3?           | default (-O0) |      12 min |       2 min |  7 min |

## Artefacts 

```
mv wasm/packages/core/dist/* /home/jozefchutka/dist/yscene-ff.../
```
Artefacts appears in `/wasm/packages/core/dist`

# Issues

## Git

```
git config --global user.email "jozefchutka@gmail.com"
git config --global user.name "Jozef Chutka"
```

- _insufficient permission for adding an object to repository database_ : `sudo chmod -R a+rwX .` (more)[https://stackoverflow.com/questions/6448242/git-push-error-insufficient-permission-for-adding-an-object-to-repository-datab]


fix WebP

```
rm -rf third_party/libwebp/
rm -rf build/share/WebP/
rm -rf build/libweb*
rm -rf build/lib/libweb*
rm -rf build/lib/pkgconfig/libweb*
rm -rf build/include/webp/
```