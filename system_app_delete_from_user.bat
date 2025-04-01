@echo off
setlocal enabledelayedexpansion

:: Verify ADB connectivity
call :check_adb

if "%~1"=="" (
    echo Usage: %~nx0 ^<package-name^>
    echo Example: %~nx0 com.facebook.appmanager
    exit /b 1
)

set "packageName=%~1"

echo Removing from user profile: !packageName!
adb shell pm uninstall -k --user 0 !packageName! 2>nul

if %errorlevel% equ 0 (
    echo Success: !packageName! removed
) else (
    echo Failed to remove !packageName!
    echo 1. Verify package exists
    echo 2. Check if system app
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