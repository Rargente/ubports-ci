#!/bin/bash
source halium.env
cd $ANDROID_ROOT

source build/envsetup.sh
export LC_ALL=C && export USE_NINJA=false && export USE_CCACHE=1 && export ALLOW_MISSING_DEPENDENCIES=true
breakfast $DEVICE
#make -j$(nproc) hybris-hal
make -j$(nproc) halium-boot
make -j$(nproc) systemimage 

echo "md5sum halium-boot.img and system.img"
md5sum $ANDROID_ROOT/out/target/product/${DEVICE}/halium-boot.img
md5sum $ANDROID_ROOT/out/target/product/${DEVICE}/system.img
