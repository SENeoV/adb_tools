@echo off
setlocal enabledelayedexpansion

:: Verify ADB connectivity
call :check_adb

echo Rebooting to bootloader...
adb reboot bootloader

if %errorlevel% equ 0 (
    echo Bootloader mode initiated
    echo Device may show fastboot screen
) else (
    echo Failed to enter bootloader
    echo 1. Check OEM unlock status
    echo 2. Verify device compatibility
)

echo Note: Use fastboot commands now if needed
pause
exit /b

:check_adb
cd /d "%~dp0min_adb_fastboot"
adb devices | find "device" >nul || (
    echo Error: Device not in ADB mode
    pause
    exit /b 1
)
exit /b