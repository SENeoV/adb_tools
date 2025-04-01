@echo off
:: Set min_adb_fastboot as current folder
cd /d "%~dp0min_adb_fastboot"
:: List all system apps on the connected Android device
echo Listing system apps:
adb shell pm list packages -s | sort
pause