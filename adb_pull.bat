@echo off
setlocal enabledelayedexpansion

:: Verify ADB connectivity
call :check_adb

if "%~2"=="" (
    echo Usage: %~nx0 ^<device_file^> ^<local_path^>
    echo Example: %~nx0 /sdcard/file.txt C:\Backup\
    exit /b 1
)

set "deviceFile=%~1"
set "localPath=%~2"

if not exist "!localPath!\" (
    echo Creating directory: !localPath!
    mkdir "!localPath!" >nul 2>&1
)

echo Pulling "!deviceFile!" from device...
adb pull "!deviceFile!" "!localPath!"

if %errorlevel% equ 0 (
    echo File retrieved successfully
) else (
    echo Failed to retrieve file
    echo 1. Verify file exists on device
    echo 2. Check path permissions
)

pause
exit /b

:check_adb
cd /d "%~dp0min_adb_fastboot"
adb devices | find "device" >nul || (
    echo Error: Device connection required
    pause
    exit /b 1
)
exit /b