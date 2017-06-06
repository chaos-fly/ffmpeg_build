#!/bin/bash

PREFIX=../mac

cd x264

./configure --prefix=$PREFIX \
    --enable-static \
    --enable-pic \
    --disable-asm \
    --disable-cli 

make clean
make -j 4
make install

cd ../
