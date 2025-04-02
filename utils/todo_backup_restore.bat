@echo off
title ADB App Backup & Restore
setlocal enabledelayedexpansion

:: Check if ADB is installed
adb version >nul 2>&1
if %errorlevel% neq 0 (
    echo ADB not found! Please install ADB and ensure it's in your PATH.
    pause
    exit
)

echo.
echo 1 - Backup App & Data
echo 2 - Restore Backup
echo 3 - Exit
echo.
set /p choice="Enter your choice: "

if "%choice%"=="1" goto backup
if "%choice%"=="2" goto restore
if "%choice%"=="3" exit

:backup
echo.
set /p package="Enter the app package name (or type ALL for all apps): "
set /p filename="Enter the backup filename (without extension): "

if "%package%"=="ALL" (
    adb backup -apk -shared -all -f "%filename%.ab"
) else (
    adb backup -apk -shared -f "%filename%.ab" %package%
)

echo Backup saved as %filename%.ab
pause
exit

:restore
echo.
set /p filename="Enter the backup filename (without extension): "
adb restore "%filename%.ab"

echo Restore completed.
pause
exit
