@echo off
setlocal enabledelayedexpansion

:: Verify ADB connectivity
call :check_adb

echo Listing system packages
echo -------------------------------
adb shell pm list packages -s | sort
echo -------------------------------
echo Total system packages: 
adb shell pm list packages -s | find /c "package:" 
echo -------------------------------
pause
exit /b

:check_adb
cd /d "%~dp0min_adb_fastboot"
adb devices | find "device" >nul
if %errorlevel% neq 0 (
    echo Error: Device not connected
    pause
    exit /b 1
)
exit /b