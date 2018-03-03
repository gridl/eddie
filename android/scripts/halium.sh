#! /bin/bash


set -eux


sudo dpkg --add-architecture i386

mkdir -p halium
cd halium

# repo init -u https://github.com/Halium/android -b halium-7.1
# repo sync -c

./halium/devices/setup athene


# ./mer_verify_kernel_config ../kernel/motorola/msm8952/arch/arm/configs/athene_defconfig | grep ERR -C 5
# ./halium/hybris-boot/fixup-mountpoints athene

# mka mkbootimg

# ./halium/ubports-boot/check-kernel-config kernel/motorola/msm8952/arch/arm/configs/athene_defconfig -w
