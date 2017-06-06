export PREFIX=../mac


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
        --extra-cflags="-g -I../mac/include -fPIC -Wfatal-errors -Wno-deprecated" \
        --extra-ldflags="-Wl,-rpath,../mac/lib -L../mac/lib" \
        --extra-libs=-ldl

}
    
cd ffmpeg
build_one  
make clean
make -j 4 
make install  

cd ../
