#!/bin/bash
cd x264

PREFIX=../mac

./configure --prefix=$PREFIX \
    --enable-static \
    --enable-pic \
    --disable-asm \
    --disable-cli 

make clean
make
make install

cd ../
