#!/bin/bash
NDK=/Users/grj/Library/Android/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-15/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
PREFIX=`pwd`/android/arm

cd x264

./configure --prefix=$PREFIX \
    --enable-static \
    --enable-pic \
    --disable-asm \
    --disable-cli \
    --host=arm-linux \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
    --sysroot=$SYSROOT

make clean
make -j 4
make install

cd -
