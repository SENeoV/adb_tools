@echo off
setlocal enabledelayedexpansion

call check_adb.bat || exit /b

echo Listing user-installed packages
echo -------------------------------
adb shell pm list packages -3 | sort
echo -------------------------------
echo Total packages: 
adb shell pm list packages -3 | find /c "package:" 
echo -------------------------------
pause
exit /b

:adb_error
echo Error: No device connected or unauthorized
echo 1. Verify USB connection
echo 2. Enable USB Debugging
echo 3. Allow USB debugging prompt
pause
exit /b 1