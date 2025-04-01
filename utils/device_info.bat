@echo off
setlocal enabledelayedexpansion

call "%~dp0\check_adb.bat" || exit /b

echo Device Information
echo ==================
adb shell getprop ro.product.manufacturer
adb shell getprop ro.product.model
adb shell getprop ro.build.version.release
adb shell getprop ro.serialno
echo ==================
pause
exit /b