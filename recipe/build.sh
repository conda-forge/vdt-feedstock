#!/bin/bash
set -ex

mkdir build-dir
cd build-dir

# SSE off required for ARM and POWER builds
cmake ${CMAKE_ARGS} \
    -DSSE=OFF \
    -DCMAKE_BUILD_TYPE=release \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_INSTALL_LIBDIR="${PREFIX}/lib" \
    -DCMAKE_CXX_COMPILER="${GXX}" \
    -DCMAKE_C_COMPILER="${GCC}" \
    ..

make -j${CPU_COUNT}

make install
