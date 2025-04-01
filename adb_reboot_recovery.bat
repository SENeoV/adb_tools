@echo off
setlocal enabledelayedexpansion

:: Verify ADB connectivity
call :check_adb

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

:check_adb
cd /d "%~dp0min_adb_fastboot"
adb devices | find "device" >nul || goto :adb_error
exit /b

:adb_error
echo Error: No active ADB connection
pause
exit /b 1