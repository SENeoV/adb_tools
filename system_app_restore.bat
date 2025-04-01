@echo off
:: Set min_adb_fastboot as current folder
cd /d "%~dp0min_adb_fastboot"
:: Check if package name provided
if "%~1"=="" (
    echo Usage: system_app_restore.bat ^<package-name^>
    echo Example: system_app_restore.bat com.example.app
    exit /b 1
)
:: Store the package name
set "packageName=%~1"
:: echo Command: adb shell cmd package install-existing %packageName%
:: Disable the package using adb
adb shell cmd package install-existing %packageName% 2>nul
pause