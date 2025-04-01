@echo off
setlocal enabledelayedexpansion

call "%~dp0\check_adb.bat" || exit /b

if "%~1"=="" (
    echo Usage: %~nx0 ^<update-package^>
    echo Example: %~nx0 update.zip
    echo Note: Device must be in sideload mode first
    exit /b 1
)

set "packagePath=%~1"

if not exist "!packagePath!" (
    echo Error: File not found
    echo "!packagePath!" does not exist
    pause
    exit /b 1
)

echo Important: Device must be in recovery with "Apply update via ADB" selected
echo Press any key to begin sideloading...
pause >nul

echo Sideloading !packagePath!...
adb sideload "!packagePath!"

if %errorlevel% equ 0 (
    echo Sideload completed successfully
) else (
    echo Sideload failed
    echo 1. Verify recovery mode
    echo 2. Check package compatibility
)

pause
exit /b