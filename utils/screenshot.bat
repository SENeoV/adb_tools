@echo off
setlocal
set "filename=screenshot_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.png"

call "%~dp0\check_adb.bat" || exit /b

echo Capturing screenshot...
adb exec-out screencap -p > "%filename%"

if exist "%filename%" (
    echo Screenshot saved: %filename%
) else (
    echo Failed to capture screenshot
)

pause
exit /b