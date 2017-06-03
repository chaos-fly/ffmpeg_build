# 裁剪ffmpeg，包括x264
export NDK=/Users/grj/Library/Android/sdk/ndk-bundle
export PREBUILT=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
export PLATFORM=$NDK/platforms/android-15/arch-arm
export PREFIX=android/arm

function build_one
{  
    ./configure \
        --target-os=linux \
        --prefix=$PREFIX \
        --enable-cross-compile \
        --enable-runtime-cpudetect \
        --disable-asm \
        --arch=arm \
        --cc=$PREBUILT/bin/arm-linux-androideabi-gcc \
        --cross-prefix=$PREBUILT/bin/arm-linux-androideabi- \
        --disable-stripping \
        --nm=$PREBUILT/bin/arm-linux-androideabi-nm \
        --sysroot=$PLATFORM \
        --enable-gpl \
        --enable-shared \
        --disable-static \
        --enable-nonfree \
        --enable-version3 \
        --enable-small \
        --disable-vda \
        --disable-iconv \
        --disable-encoders \
        --enable-libx264 \
        --enable-encoder=libx264 \
        --disable-muxers \
        --enable-muxer=mov \
        --enable-muxer=ipod \
        --enable-muxer=psp \
        --enable-muxer=mp4 \
        --enable-muxer=avi \
        --disable-decoders \
        --enable-decoder=aac \
        --enable-decoder=aac_latm \
        --enable-decoder=h264 \
        --enable-decoder=mpeg4 \
        --disable-demuxers \
        --enable-demuxer=h264 \
        --enable-demuxer=avi \
        --enable-demuxer=mpc \
        --enable-demuxer=mov \
        --disable-parsers \
        --enable-parser=aac \
        --enable-parser=ac3 \
        --enable-parser=h264 \
        --disable-protocols \
        --enable-protocol=file \
        --disable-bsfs \
        --enable-bsf=aac_adtstoasc \
        --enable-bsf=h264_mp4toannexb \
        --disable-indevs --enable-zlib \
        --disable-outdevs --disable-ffprobe \
        --disable-ffplay --disable-ffmpeg --disable-ffserver --disable-debug \
        --extra-cflags="-I android/arm/include -fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -mfloat-abi=softfp -marm -march=armv7-a" \
        --extra-ldflags="-L android/arm/lib"  
}  
    
build_one  
    
make clean
make  
make install  

function tar_one
{
    $PREBUILT/bin/arm-linux-androideabi-ld \
        -rpath-link=$PLATFORM/usr/lib \
        -L$PLATFORM/usr/lib \
        -L$PREFIX/lib \
        -soname libffmeg.so \
        -shared -nostdlib -Bsymbolic --whole-archive --no-undefined \
        -o $PREFIX/libffmpeg.so \
        libavcodec/libavcodec.a \
        libavfilter/libavfilter.a \
        libswresample/libswresample.a \
        libavformat/libavformat.a \
        libavutil/libavutil.a \
        libswscale/libswscale.a \
        libpostproc/libpostproc.a \
        libavdevice/libavdevice.a \
        -lc -lm -lz -ldl -llog --dynamic-linker=/system/bin/linker \
        $PREBUILT/lib/gcc/arm-linux-androideabi/4.9.x/libgcc.a  
}
