#!/bin/bash

find /data/ffmpeg_build \( -path /data/ffmpeg_build/mac \) -prune -o -name '*.h' -o -name '*.cpp' -o -name '*.c' > cscope.files
cscope -bkq -i cscope.files
