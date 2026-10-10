setlocal

rem HFsalm0n: set color to COM
color 2

rem HFsalm0n: getting a way to that script
set "BASE=%~dp0"

if "%BASE:~-1%"=="\" set "BASE=%BASE:~0,-1%"

set "TARGET_BAT=%BASE%\EZ_shutdown2.bat"
set "ICON=%BASE%\pwroff_icon.ico"
set "LNK=%USERPROFILE%\Desktop\Power off.lnk"

echo Base folder: %BASE%
echo Target bat:  %TARGET_BAT%
echo Icon:        %ICON%
echo Shortcut:    %LNK%
echo.

if not exist "%TARGET_BAT%" (
    echo [ERROR] EZ_shutdown2.bat not found next to this script.
    pause
    exit /b 1
)
if not exist "%ICON%" (
    echo [ERROR] pwroff_icon.ico not found next to this script.
    pause
    exit /b 1
)

rem HFsalm0n: Creating a shortcut by pwrshl
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ws = New-Object -ComObject WScript.Shell;" ^
  "$sc = $ws.CreateShortcut('%LNK%');" ^
  "$sc.TargetPath = '%TARGET_BAT%';" ^
  "$sc.WorkingDirectory = '%BASE%';" ^
  "$sc.IconLocation = '%ICON%,0';" ^
  "$sc.WindowStyle = 1;" ^
  "$sc.Description = 'EZ Power Off';" ^
  "$sc.Save();"

if errorlevel 1 (
    echo [ERROR] Failed to create shortcut.
    pause
    exit /b 1
)

echo Shortcut created: %LNK%
pause
