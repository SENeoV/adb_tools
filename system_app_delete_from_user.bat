@echo off
:: Set min_adb_fastboot as current folder
cd /d "%~dp0min_adb_fastboot"
:: Check if package name provided
if "%~1"=="" (
    echo Usage: system_app_delete_from_user.bat ^<package-name^>
    echo Example: system_app_delete_from_user.bat com.example.app
    exit /b 1
)
:: Store the package name
set "packageName=%~1"
:: echo Command: adb shell pm uninstall -k --user 0 %packageName%
:: Delete the package using adb
adb shell pm uninstall -k --user 0 %packageName% 2>nul
pause