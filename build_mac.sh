export NDK=/Users/grj/Library/Android/sdk/ndk-bundle
export PREBUILT=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
export PLATFORM=$NDK/platforms/android-15/arch-arm
export PREFIX=../mac

cd ffmpeg

# 完整包
function build_one
{
    ./configure \
        --prefix=$PREFIX \
        --enable-runtime-cpudetect \
        --disable-asm \
        --disable-stripping \
        --enable-gpl \
        --enable-nonfree \
        --enable-libx264 \
        --enable-shared --disable-static --enable-small \
        --disable-ffprobe --disable-ffplay --disable-ffmpeg --disable-ffserver \
        --extra-cflags="-I../mac/include -fPIC -Wfatal-errors -Wno-deprecated" \
        --extra-ldflags="-Wl,-rpath,../mac/lib -L ../mac/lib"
}
    
build_one  
    
make clean
make  
make install  

cd ../
