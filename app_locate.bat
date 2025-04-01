@echo off
setlocal enabledelayedexpansion

:: Verify ADB connectivity
call :check_adb

:: Check package parameter
if "%~1"=="" (
    echo Usage: %~nx0 ^<package-name^>
    echo Example: %~nx0 com.example.app
    exit /b 1
)

set "packageName=%~1"

echo Searching for package: !packageName!
echo -------------------------------
adb shell pm path !packageName! 2>nul

if %errorlevel% neq 0 (
    echo No package found: !packageName!
    echo 1. Verify package name
    echo 2. Check if app is installed
)

echo -------------------------------
pause
exit /b

:check_adb
cd /d "%~dp0min_adb_fastboot"
adb devices | find "device" >nul
if %errorlevel% neq 0 (
    echo Error: No device connected or unauthorized
    echo 1. Verify USB connection
    echo 2. Enable USB Debugging
    echo 3. Allow USB debugging prompt
    pause
    exit /b 1
)
exit /b