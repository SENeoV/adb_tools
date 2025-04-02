@echo off
title ADB Device Info
setlocal enabledelayedexpansion

:: Check if ADB is installed
adb version >nul 2>&1
if %errorlevel% neq 0 (
    echo ADB not found! Please install ADB and ensure it's in your PATH.
    pause
    exit
)

echo Retrieving device information...
echo ----------------------------------
adb shell getprop ro.product.model
adb shell getprop ro.build.version.release
adb shell getprop ro.product.cpu.abi
adb shell dumpsys battery | findstr "level status"
adb shell df -h /data | findstr "/data"
echo ----------------------------------
pause
exit
