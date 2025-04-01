@echo off
setlocal enabledelayedexpansion

call "%~dp0\check_adb.bat" || exit /b

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