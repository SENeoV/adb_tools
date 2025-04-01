@echo off
echo Clearing ADB Cache and Restarting
taskkill /f /im adb.exe >nul 2>&1
cd /d "%~dp0min_adb_fastboot"
start adb kill-server
timeout /t 2 >nul
start adb start-server
echo ADB services restarted
pause