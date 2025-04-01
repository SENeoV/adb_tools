@echo off
setlocal enabledelayedexpansion

call "%~dp0\common\check_adb.bat" || exit /b

echo Listing user-installed packages
echo -------------------------------
adb shell pm list packages -3 | sort
echo -------------------------------
echo Total packages: 
adb shell pm list packages -3 | find /c "package:" 
echo -------------------------------
pause
exit /b