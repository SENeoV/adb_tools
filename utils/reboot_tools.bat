@echo off
title ADB Reboot Tools
setlocal enabledelayedexpansion

:: Check if ADB is installed
adb version >nul 2>&1
if %errorlevel% neq 0 (
    echo ADB not found! Please install ADB and ensure it's in your PATH.
    pause
    exit
)

echo.
echo 1 - Normal Reboot
echo 2 - Reboot to Recovery Mode
echo 3 - Reboot to Fastboot/Bootloader
echo 4 - Reboot to Safe Mode
echo 5 - Exit
echo.
set /p choice="Enter your choice: "

if "%choice%"=="1" goto normal_reboot
if "%choice%"=="2" goto recovery
if "%choice%"=="3" goto bootloader
if "%choice%"=="4" goto safe_mode
if "%choice%"=="5" exit

:normal_reboot
adb reboot
echo Device is rebooting...
pause
exit

:recovery
adb reboot recovery
echo Rebooting to Recovery Mode...
pause
exit

:bootloader
adb reboot bootloader
echo Rebooting to Fastboot/Bootloader Mode...
pause
exit

:safe_mode
adb shell am broadcast -a android.intent.action.BOOT_COMPLETED
adb shell setprop persist.sys.safemode 1
adb reboot
echo Rebooting to Safe Mode...
pause
exit
