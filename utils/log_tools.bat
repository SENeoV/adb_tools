@echo off
title ADB Log Retrieval
setlocal enabledelayedexpansion

:: Check if ADB is installed
adb version >nul 2>&1
if %errorlevel% neq 0 (
    echo ADB not found! Please install ADB and ensure it's in your PATH.
    pause
    exit
)

echo.
echo 1 - View Live Logcat
echo 2 - Save Logcat to File
echo 3 - Exit
echo.
set /p choice="Enter your choice: "

if "%choice%"=="1" goto live_log
if "%choice%"=="2" goto save_log
if "%choice%"=="3" exit

:live_log
adb logcat -v time
pause
exit

:save_log
set /p filename="Enter filename for the log (without extension): "
adb logcat -v time -d > %filename%.txt
echo Log saved as %filename%.txt
pause
exit
@echo off
title ADB Log Retrieval
setlocal enabledelayedexpansion

:: Check if ADB is installed
adb version >nul 2>&1
if %errorlevel% neq 0 (
    echo ADB not found! Please install ADB and ensure it's in your PATH.
    pause
    exit
)

echo.
echo 1 - View Live Logcat
echo 2 - Save Logcat to File
echo 3 - Exit
echo.
set /p choice="Enter your choice: "

if "%choice%"=="1" goto live_log
if "%choice%"=="2" goto save_log
if "%choice%"=="3" exit

:live_log
adb logcat -v time
pause
exit

:save_log
set /p filename="Enter filename for the log (without extension): "
adb logcat -v time -d > %filename%.txt
echo Log saved as %filename%.txt
pause
exit
