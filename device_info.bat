@echo off
setlocal enabledelayedexpansion

call :check_adb

echo Device Information
echo ==================
adb shell getprop ro.product.manufacturer
adb shell getprop ro.product.model
adb shell getprop ro.build.version.release
adb shell getprop ro.serialno
echo ==================
pause
exit /b

:check_adb
cd /d "%~dp0min_adb_fastboot"
adb devices | find "device" >nul || (
    echo Error: No device connected
    pause
    exit /b 1
)
exit /b