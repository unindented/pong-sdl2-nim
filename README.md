# Pong clone built with Nim [![Build Status](https://img.shields.io/travis/unindented/pong-sdl2-nim.svg)](http://travis-ci.org/unindented/pong-sdl2-nim)

## Prerequisites

### Linux

Install Nim:

```
sudo apt install curl
curl https://nim-lang.org/choosenim/init.sh -sSf | sh
```

Install SDL2:

```
sudo apt install build-essential libsdl2{,-mixer,-ttf}-dev
```

### macOS

Install Nim and SDL2:

```
brew install nim sdl2{,_mixer,_ttf}
```

### Windows

Install MingW:

- 32 bit - [mingw32-6.3.0.7z](https://nim-lang.org/download/mingw32-6.3.0.7z)
- 64 bit - [mingw64-6.3.0.7z](https://nim-lang.org/download/mingw64-6.3.0.7z)

Install Nim:

- 32 bit - [nim-0.18.0_x32.zip](https://nim-lang.org/download/nim-0.18.0_x32.zip)
- 64 bit - [nim-0.18.0_x64.zip](https://nim-lang.org/download/nim-0.18.0_x64.zip)

Download SDL2 development libraries:

- <https://www.libsdl.org/release/SDL2-devel-2.0.8-mingw.tar.gz>
- <https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-devel-2.0.2-mingw.tar.gz>
- <https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-devel-2.0.14-mingw.tar.gz>

## Install

To install all dependencies, run:

```
nimble install
```

## Test

To run all unit tests, do:

```
nimble test
```

## Build

To build the game for development, do:

```
nimble builddev
```

To build the game for production, do:

```
nimble buildprod
```

## Run

To run the game for development, do:

```
nimble rundev
```

To run the game for production, do:

```
nimble runprod
```

## Meta

- Code: `git clone https://github.com/unindented/pong-sdl2-nim.git`
- Home: <https://unindented.org/>

## Contributors

Daniel Perez Alvarez ([unindented@gmail.com](mailto:unindented@gmail.com))

## License

Copyright (c) 2018 Daniel Perez Alvarez ([unindented.org](https://unindented.org/)). This is free software, and may be redistributed under the terms specified in the LICENSE file.
