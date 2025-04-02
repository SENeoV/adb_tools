@echo off
title ADB Wireless Connection
setlocal enabledelayedexpansion

:: Check if ADB is installed
adb version >nul 2>&1
if %errorlevel% neq 0 (
    echo ADB not found! Please install ADB and ensure it's in your PATH.
    pause
    exit
)

echo.
echo 1 - Enable Wireless ADB
echo 2 - Connect to Device via IP
echo 3 - Disconnect Wireless ADB
echo 4 - Exit
echo.
set /p choice="Enter your choice: "

if "%choice%"=="1" goto enable_wireless
if "%choice%"=="2" goto connect_wireless
if "%choice%"=="3" goto disconnect
if "%choice%"=="4" exit

:enable_wireless
echo Make sure your device is connected via USB first.
adb tcpip 5555
echo Wireless ADB enabled. Now disconnect USB and use option 2 to connect via IP.
pause
exit

:connect_wireless
set /p device_ip="Enter the device IP address: "
adb connect %device_ip%:5555
echo Connected to %device_ip%.
pause
exit

:disconnect
adb disconnect
echo Wireless ADB disconnected.
pause
exit
