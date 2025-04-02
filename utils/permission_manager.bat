@echo off
title ADB Permission Manager
setlocal enabledelayedexpansion

:: Check if ADB is installed
adb version >nul 2>&1
if %errorlevel% neq 0 (
    echo ADB not found! Please install ADB and ensure it's in your PATH.
    pause
    exit
)

echo.
echo 1 - Grant Permission
echo 2 - Revoke Permission
echo 3 - Exit
echo.
set /p choice="Enter your choice: "

if "%choice%"=="1" goto grant_permission
if "%choice%"=="2" goto revoke_permission
if "%choice%"=="3" exit

:grant_permission
echo.
set /p package_name="Enter the app package name: "
set /p permission="Enter the permission to grant (e.g., android.permission.CAMERA): "

adb shell pm grant %package_name% %permission%
echo Permission granted to %package_name% for %permission%.
pause
exit

:revoke_permission
echo.
set /p package_name="Enter the app package name: "
set /p permission="Enter the permission to revoke (e.g., android.permission.CAMERA): "

adb shell pm revoke %package_name% %permission%
echo Permission revoked from %package_name% for %permission%.
pause
exit
