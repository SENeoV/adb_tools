@echo off

:: Verify ADB connectivity
cd /d "%~dp0..\min_adb_fastboot"
adb devices | findstr /r /c:"device$" >nul
if %errorlevel% neq 0 goto :adb_error
exit /b 0

:: Error debug
:adb_error
echo Error: No device connected or unauthorized
echo 1. Verify USB connection
echo 2. Enable USB Debugging
echo 3. Allow USB debugging prompt
pause
exit /b 1