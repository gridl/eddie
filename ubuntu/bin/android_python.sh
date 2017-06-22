#! /bin/bash

set -x


adb devices
adb root
adb shell "mount -o remount,rw /system"

adb shell "mkdir -p /data/local/scripts"
adb shell "mkdir -p /data/local/tmp"
adb shell "chmod -R 777 /data/local/tmp"

adb shell "mkdir -p /bin"
adb shell "ln -s /system/bin/sh /bin/sh"

echo 'Ensure qpython is installed by running a program'

PYTHON='/data/data/org.qpython.qpy/files/bin/qpython-android5.sh'
adb shell "mkdir -p /usr/bin/"
adb shell "ln -s /system/bin/sh /bin/sh"
adb shell "ln -s $PYTHON /usr/bin/python"


adb push -p ubuntu/config/mkshrc /system/etc/mkshrc

adb shell "mount -o remount,ro /system"
