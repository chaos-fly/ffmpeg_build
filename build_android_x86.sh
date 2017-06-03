#!/bin/bash
NDK=/Users/grj/Library/Android/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-14/arch-x86
TOOLCHAIN=$NDK/toolchains/x86-4.9/prebuilt/darwin-x86_64

PREFIX=`pwd`/android/x86
ADDI_CFLAGS=

function build_one
{
    ./configure \
        --prefix=$PREFIX \
        --enable-shared \
        --disable-static \
        --disable-doc \
        --disable-ffmpeg \
        --disable-ffplay \
        --disable-ffprobe \
        --disable-ffserver \
        --disable-avdevice \
        --disable-doc \
        --disable-symver \
        --disable-yasm \
        --disable-asm \
        --target-os=linux \
        --cross-prefix=$TOOLCHAIN/bin/i686-linux-android- \
        --arch=x86 \
        --sysroot=$SYSROOT \
        --enable-cross-compile \
        --extra-cflags="-Os -fpic $ADDI_CFLAGS" \
        --extra-ldflags="$ADDI_LDFLAGS" \
        $ADDITIONAL_CONFIGURE_FLAG
    make clean
    make
    make -j 4 install
}
build_one
