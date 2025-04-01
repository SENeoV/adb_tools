@echo off
setlocal enabledelayedexpansion

call "%~dp0\check_adb.bat" || exit /b

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