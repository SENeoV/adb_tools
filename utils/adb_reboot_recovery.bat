@echo off
setlocal enabledelayedexpansion

call "%~dp0\common\check_adb.bat" || exit /b

echo Rebooting to recovery mode...
adb reboot recovery

if %errorlevel% equ 0 (
    echo Recovery reboot initiated
    echo Device may show manufacturer logo
) else (
    echo Failed to initiate recovery reboot
    echo 1. Check device compatibility
    echo 2. Verify bootloader unlock status
)

pause
exit /b