#! /bin/bash

set -x

mkdir rr
cd rr

repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b oreo
repo sync -f --force-sync --no-clone-bundle

# git  clone  device/motorola/athene" name="chillaranand/
# device/motorola/qcom-common" name="android_device_motorola_qcom-common
# device/qcom/common" name="android_device_qcom_common
# device/qcom/sepolicy" name="android_device_qcom_sepolicy
# external/bson" name="android_external_bson
# external/stlport" name="android_external_stlport
# external/sony/boringssl-compat" name="android_external_sony_boringssl-compat
# kernel/motorola/msm8952" name="chillaranand/android_kernel_motorola_msm8952
# packages/resources/devicesettings" name="android_packages_resources_devicesettings
# vendor/motorola" name="proprietary_vendor_motorola


. build/envsetup.sh
brunch athene
