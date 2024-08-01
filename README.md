# Magisk_OverlayFS_and_Adb-Root-Enabler
This is a combination of two existing Magisk modules that have been tweaked with some fixes and combined into a single module.  Once installed, you can enable "adb root" on a PROD Android device (tested with Android 14 ARM64 emulator) and mount "/system" as writable (using an OverlayFS).  In addition, there is a script to patch MobSF to support newer versions of Android (currently 14, API 34) and then apply necessary settings to your emulator (assuming this module is already installed) to allow it to work with MobSF dynamic analysis.

Credit for original modules goes to: https://github.com/HuskyDG/magic_overlayfs and https://github.com/anasfanani/Adb-Root-Enabler

## To Use
1. Download module from Releases and install via Magisk Manager, then reboot. Hint - if you need Magisk on the emulator look into RootAVD and the "FAKEBOOTIMG" option).
2. Ensure you have configured your MobSF Docker container to point to the emulator using the instructions found here and that it is running: https://mobsf.github.io/docs/#/dynamic_analyzer?id=android-studio-emulator (specifically, the part about MOBSF_ANALYZER_IDENTIFIER).
3. Run included "run_from_host_for_mobsf.sh" script with your container's name as the first argument and the emulator's name as the second argument.
4. Browse to your MobSF site -> Dynamic Analysis -> MobSFy (to install configuration).
