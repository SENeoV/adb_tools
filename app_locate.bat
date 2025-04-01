@echo off
:: Check if package name provided
if "%~1"=="" (
    echo Usage: app_locate.bat ^<package-name^>
    echo Example: app_locate.bat com.example.app
    exit /b 1
)
:: Store the package name
set "packageName=%~1"
:: echo Command: adb shell pm path %packageName%
:: Locate the package using adb
adb shell pm path %packageName% 2>nul
pause