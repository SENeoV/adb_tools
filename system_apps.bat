@echo off
setlocal enabledelayedexpansion

call check_adb.bat || exit /b

echo Listing system packages
echo -------------------------------
adb shell pm list packages -s | sort
echo -------------------------------
echo Total system packages: 
adb shell pm list packages -s | find /c "package:" 
echo -------------------------------
pause
exit /b