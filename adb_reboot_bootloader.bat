@echo off
setlocal enabledelayedexpansion

call check_adb.bat || exit /b

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