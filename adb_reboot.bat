@echo off
setlocal enabledelayedexpansion

:: Verify ADB connectivity
call :check_adb

echo Rebooting device...
adb reboot

if %errorlevel% equ 0 (
    echo Reboot command sent successfully
) else (
    echo Failed to send reboot command
    echo Ensure device is properly connected
)

pause
exit /b

:check_adb
cd /d "%~dp0min_adb_fastboot"
adb devices | find "device" >nul || (
    echo Error: Device not connected or unauthorized
    pause
    exit /b 1
)
exit /b