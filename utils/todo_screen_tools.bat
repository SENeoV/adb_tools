@echo off
title ADB Screen Recorder & Screenshot Tool
setlocal enabledelayedexpansion

:: Check if ADB is installed
adb version >nul 2>&1
if %errorlevel% neq 0 (
    echo ADB not found! Please install ADB and ensure it's in your PATH.
    pause
    exit
)

echo.
echo 1 - Record Screen
echo 2 - Capture Screenshot
echo 3 - Exit
echo.
set /p choice="Enter your choice: "

if "%choice%"=="1" goto record
if "%choice%"=="2" goto screenshot
if "%choice%"=="3" exit

:record
echo.
set /p duration="Enter recording duration (in seconds, max 180): "
set /p filename="Enter filename for the recording (without extension): "

adb shell screenrecord /sdcard/%filename%.mp4 --time-limit %duration%
adb pull /sdcard/%filename%.mp4
adb shell rm /sdcard/%filename%.mp4

echo Screen recording saved as %filename%.mp4
pause
exit

:screenshot
echo.
set /p filename="Enter filename for the screenshot (without extension): "

adb shell screencap -p /sdcard/%filename%.png
adb pull /sdcard/%filename%.png
adb shell rm /sdcard/%filename%.png

echo Screenshot saved as %filename%.png
pause
exit
@echo off
title ADB Screen Recorder & Screenshot Tool
setlocal enabledelayedexpansion

:: Check if ADB is installed
adb version >nul 2>&1
if %errorlevel% neq 0 (
    echo ADB not found! Please install ADB and ensure it's in your PATH.
    pause
    exit
)

echo.
echo 1 - Record Screen
echo 2 - Capture Screenshot
echo 3 - Exit
echo.
set /p choice="Enter your choice: "

if "%choice%"=="1" goto record
if "%choice%"=="2" goto screenshot
if "%choice%"=="3" exit

:record
echo.
set /p duration="Enter recording duration (in seconds, max 180): "
set /p filename="Enter filename for the recording (without extension): "

adb shell screenrecord /sdcard/%filename%.mp4 --time-limit %duration%
adb pull /sdcard/%filename%.mp4
adb shell rm /sdcard/%filename%.mp4

echo Screen recording saved as %filename%.mp4
pause
exit

:screenshot
echo.
set /p filename="Enter filename for the screenshot (without extension): "

adb shell screencap -p /sdcard/%filename%.png
adb pull /sdcard/%filename%.png
adb shell rm /sdcard/%filename%.png

echo Screenshot saved as %filename%.png
pause
exit
