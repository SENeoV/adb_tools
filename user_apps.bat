@echo off
:: Set min_adb_fastboot as current folder
cd /d "%~dp0min_adb_fastboot"
:: List all user-installed packages on the connected Android device
echo Listing user-installed packages:
adb shell pm list packages -3
pause