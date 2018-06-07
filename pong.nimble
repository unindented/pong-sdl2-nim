# Package

version = "0.0.1"
author = "Daniel Perez Alvarez"
description = "A Pong clone built with Nim and SDL2"
license = "MIT"
srcDir = "src"
binDir = "build"
bin = @["pong"]

# Dependencies

requires "nim >= 0.18.0"
requires "sdl2 >= 1.1"

# Tasks

task test, "Runs the test suite":
  exec "nim c -r tests/tester"

task builddev, "Builds the game for development":
  exec "nimble build"

task buildprod, "Builds the game for production":
  exec "nimble build --define:release --opt:size"

task rundev, "Runs the game for development":
  exec "nimble build -r"

task runprod, "Runs the game for production":
  exec "nimble build --define:release --opt:size -r"
