@echo off
:: Check if package name provided
if "%~1"=="" (
    echo Usage: system_app_disable.bat ^<package-name^>
    echo Example: system_app_disable.bat com.example.app
    exit /b 1
)
:: Store the package name
set "packageName=%~1"
:: echo Command: adb shell pm disable-user --user 0 %packageName%
:: Disable the package using adb
adb shell pm disable-user --user 0 %packageName% 2>nul
pause