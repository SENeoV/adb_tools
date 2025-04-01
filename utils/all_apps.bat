@echo off
setlocal enabledelayedexpansion

call "%~dp0\common\check_adb.bat" || exit /b

echo Listing all packages
echo -------------------------------
adb shell pm list packages | sort
echo -------------------------------
echo Total installed packages: 
adb shell pm list packages | find /c "package:" 
echo -------------------------------
pause
exit /b