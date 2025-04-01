@echo off
:: List all system apps on the connected Android device
echo Listing system apps:
adb shell pm list packages -s | sort
pause