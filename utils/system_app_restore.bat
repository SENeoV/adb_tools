@echo off
call "%~dp0\common\check_adb.bat" || exit /b

:: Check package parameter
if "%~1"=="" (
    echo Usage: %~nx0 ^<package-name^>
    echo Example: %~nx0 com.example.app
    exit /b 1
)

set "packageName=%~1"

echo Restoring package: %packageName%
adb shell cmd package install-existing %packageName% 2>nul

if %errorlevel% equ 0 (
    echo Success: Package restored
) else (
    echo Error: Failed to restore package
)

pause
exit /b