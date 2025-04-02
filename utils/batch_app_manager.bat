@echo off
title ADB Batch App Manager
setlocal enabledelayedexpansion

:: Check if ADB is installed
adb version >nul 2>&1
if %errorlevel% neq 0 (
    echo ADB not found! Please install ADB and ensure it's in your PATH.
    pause
    exit
)

echo.
echo 1 - Batch Install APKs
echo 2 - Batch Uninstall Apps
echo 3 - Exit
echo.
set /p choice="Enter your choice: "

if "%choice%"=="1" goto batch_install
if "%choice%"=="2" goto batch_uninstall
if "%choice%"=="3" exit

:batch_install
set /p folder="Enter the folder path containing APKs: "
for %%f in (%folder%\*.apk) do (
    echo Installing %%f ...
    adb install "%%f"
)
echo Installation complete.
pause
exit

:batch_uninstall
set /p list_file="Enter the text file containing package names (one per line): "
for /f %%p in (%list_file%) do (
    echo Uninstalling %%p ...
    adb uninstall %%p
)
echo Uninstallation complete.
pause
exit
