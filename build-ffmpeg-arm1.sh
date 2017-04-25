#!/bin/bash  

cd /mnt/c/Users/lijian/linux/ffmpeg-3.2.2

make clean

export NDK=/mnt/c/Users/lijian/linux/android-ndk-r10e-linux-x86_64/android-ndk-r10e
export PREBUILT=$NDK/toolchains/arm-linux-androideabi-4.8/prebuilt
export PLATFORM=$NDK/platforms/android-8/arch-arm
export PREFIX=/mnt/c/Users/lijian/linux/simplefflib
build_one(){
./configure --target-os=linux --prefix=$PREFIX \
 --enable-cross-compile \
 --enable-runtime-cpudetect \
 --disable-asm \
 --arch=arm \
 --cc=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi-gcc \
 --cross-prefix=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi- \
 --disable-stripping \
 --nm=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi-nm \
 --sysroot=$PLATFORM \
 --enable-gpl --enable-shared --disable-static --enable-small \
 --disable-ffprobe --disable-ffplay --disable-ffmpeg --disable-ffserver --disable-debug \
 --extra-cflags="-fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -mfloat-abi=softfp -marm -march=armv7-a"
}

build_one

make
make install

cd ..