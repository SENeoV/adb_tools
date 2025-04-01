@echo off
:: Script to verify ADB connectivity

:: Navigate to the min_adb_fastboot directory
cd /d "%~dp0..\..\min_adb_fastboot"

:: Check for connected ADB devices
adb devices | findstr /r /c:"device$" >nul
if %errorlevel% neq 0 (
    call :adb_error
    exit /b 1
)
:: Exit successfully if a device is connected
exit /b 0

:: Error handling for ADB connectivity issues
:adb_error
echo =============================================================
echo Error: No device connected or unauthorized. Please check the following:
echo 1. Verify that the USB connection is properly established.
echo 2. Ensure USB Debugging is enabled on your device.
echo 3. Allow the USB debugging prompt on your device.
echo =============================================================
pause