#!/usr/bin/env bash
set -ex

[ -z "$1" ] && exit 1

CMAKE_BUILD_TYPE="Release"
PATH_TO_NDK="$1"

mkdir -p build && cd build

cmake -DCMAKE_TOOLCHAIN_FILE=$PATH_TO_NDK/build/cmake/android.toolchain.cmake -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=26 -DANDROID_STL=c++_shared -DANDROID_USE_LEGACY_TOOLCHAIN_FILE=OFF -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE ..

cmake --build .
cmake --install .
