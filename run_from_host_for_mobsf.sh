#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: ./$@ <container-name> <emulator-name>"
fi

CONTAINER_NAME="$1"
EMULATOR_NAME="$2"

docker exec -it $CONTAINER_NAME bash -c "sed -i 's/^ANDROID_API_SUPPORTED.*$/ANDROID_API_SUPPORTED = 34/g' /home/mobsf/Mobile-Security-Framework-MobSF/mobsf/DynamicAnalyzer/views/android/environment.py"
docker restart $CONTAINER_NAME
adb -s $EMULATOR_NAME shell "su -c 'mount -o remount,rw /system'"
