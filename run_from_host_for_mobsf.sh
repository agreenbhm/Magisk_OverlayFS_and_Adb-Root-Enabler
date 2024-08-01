#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <container-name> <emulator-name>"
    exit
fi

CONTAINER_NAME="$1"
EMULATOR_NAME="$2"

echo "Patching MobSF to support Android API 34"
docker exec -it $CONTAINER_NAME bash -c "sed -i 's/^ANDROID_API_SUPPORTED.*$/ANDROID_API_SUPPORTED = 34/g' /home/mobsf/Mobile-Security-Framework-MobSF/mobsf/DynamicAnalyzer/views/android/environment.py"
echo "Restarting container"
docker restart $CONTAINER_NAME
echo "Mounting emulator /system as r/w using OverlayFS"
adb -s $EMULATOR_NAME shell "su -c 'mount -o remount,rw /system; setenforce 0'"
echo "Disabling SELinux to fix issue with settings service"
adb -s $EMULATOR_NAME shell "su -c 'setenforce 0'"
