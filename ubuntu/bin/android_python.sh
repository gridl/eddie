#! /bin/bash

set -x


adb devices
adb root

adb shell "mount -o remount,rw /"
adb shell "mount -o remount,rw /system"

declare -a directories=(
    "/data/local/scripts" "/data/local/apps" "/data/local/tmp"
    "/bin"  "/usr/bin"
)
for directory in "${directories[@]}"; do
    adb shell mkdir -p "$directory"
done

adb shell "chmod -R 777 /data/local/scripts"
adb shell "chmod -R 777 /data/local/tmp"


APK_FOLDER=${HOME}'/Dropbox/android'
declare -a apps=(
    'termux.apk' 'qr.apk' 'sshd.apk' 'tea.apk'
    # 'sshdu.apk'
)
for app in "${apps[@]}"; do
    adb install "$APK_FOLDER/$app"
done


CONFIG_FOLDER=${HOME}'/projects/01/ubuntu/bin'
adb push -p "$CONFIG_FOLDER/sh.sh" /bin/sh
adb shell "chmod +x /bin/sh"
adb push -p "$CONFIG_FOLDER/python.sh" /usr/bin/python
adb shell "chmod +x /usr/bin/python"


adb push -p ubuntu/config/mkshrc.sh /system/etc/mkshrc

adb shell "mount -o remount,ro /"
adb shell "mount -o remount,ro /system"
