@echo off
setlocal enabledelayedexpansion

call check_adb.bat || exit /b

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