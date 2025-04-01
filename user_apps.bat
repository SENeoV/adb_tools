@echo off
:: List all user-installed packages on the connected Android device
echo Listing user-installed packages:
adb shell pm list packages -3
pause