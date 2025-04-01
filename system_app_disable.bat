@echo off
setlocal enabledelayedexpansion

:: Verify ADB connectivity
call :check_adb

if "%~1"=="" (
    echo Usage: %~nx0 ^<package-name^>
    echo Example: %~nx0 com.bloatware.app
    echo Warning: Disabling critical system apps may cause instability
    exit /b 1
)

set "packageName=%~1"

echo Attempting to disable: !packageName!
adb shell pm disable-user --user 0 !packageName! 2>nul

if %errorlevel% equ 0 (
    echo Success: !packageName! disabled
) else (
    echo Failed to disable !packageName!
    echo Possible reasons:
    echo 1. Package not found
    echo 2. Insufficient permissions
    echo 3. Critical system component
)

pause
exit /b

:check_adb
cd /d "%~dp0min_adb_fastboot"
adb devices | find "device" >nul || goto :adb_error
exit /b

:adb_error
echo Error: No device connected
pause
exit /b 1