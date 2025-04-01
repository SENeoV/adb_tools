@echo off
setlocal enabledelayedexpansion

:: Verify ADB connectivity
call :check_adb

if "%~2"=="" (
    echo Usage: %~nx0 ^<local_file^> ^<device_path^>
    echo Example: %~nx0 file.txt /sdcard/
    exit /b 1
)

set "localFile=%~1"
set "devicePath=%~2"

if not exist "!localFile!" (
    echo Error: Local file not found
    echo "!localFile!" does not exist
    pause
    exit /b 1
)

echo Pushing "!localFile!" to device...
adb push "!localFile!" "!devicePath!"

if %errorlevel% equ 0 (
    echo File transfer successful
) else (
    echo File transfer failed
    echo 1. Check device storage space
    echo 2. Verify write permissions
)

pause
exit /b

:check_adb
cd /d "%~dp0min_adb_fastboot"
adb devices | find "device" >nul || (
    echo Error: Device not connected
    pause
    exit /b 1
)
exit /b