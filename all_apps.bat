@echo off
:: List all user-installed packages on the connected Android device
echo Listing all installed packages:
adb shell pm list packages
pause