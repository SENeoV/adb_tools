@echo off
setlocal enabledelayedexpansion

:: Verify ADB connectivity
call :check_adb

echo Listing all packages
echo -------------------------------
adb shell pm list packages | sort
echo -------------------------------
echo Total installed packages: 
adb shell pm list packages | find /c "package:" 
echo -------------------------------
pause
exit /b

:check_adb
cd /d "%~dp0min_adb_fastboot"
adb devices | find "device" >nul || (
    echo Error: Connect device first
    pause
    exit /b 1
)
exit /b