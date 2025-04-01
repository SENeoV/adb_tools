@echo off
setlocal enabledelayedexpansion

call check_adb.bat || exit /b

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