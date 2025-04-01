@echo off
setlocal enabledelayedexpansion

:: Verify ADB connectivity
call :check_adb

echo Listing user-installed packages
echo -------------------------------
adb shell pm list packages -3 | sort
echo -------------------------------
echo Total packages: 
adb shell pm list packages -3 | find /c "package:" 
echo -------------------------------
pause
exit /b

:check_adb
cd /d "%~dp0min_adb_fastboot"
adb devices | find "device" >nul
if %errorlevel% neq 0 goto :adb_error
exit /b

:adb_error
echo Error: No device connected or unauthorized
echo 1. Verify USB connection
echo 2. Enable USB Debugging
echo 3. Allow USB debugging prompt
pause
exit /b 1