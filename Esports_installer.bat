@echo off
title Esports Installer - Full Setup
echo =============================================
echo       Installing All Esports Software
echo =============================================

cd /d "%~dp0"
setlocal enabledelayedexpansion

:: Install from subfolders first
call :installFolder "System Software"
call :installFolder "Game Software"
call :setWallpaper


:: Install Phoenix last
::if exist "%~dp0Phoenix Installer.exe" (
::    echo Installing Phoenix Installer.exe
::    start /wait "" "%~dp0Phoenix Installer.exe"
::    echo Finished Phoenix Installer.exe
::) else (
::    echo Phoenix Installer.exe not found in root folder
::)

echo.
echo =============================================
echo All installations and setup complete!
echo =============================================
echo.
pause
exit /b

:installFolder
set "TARGET_FOLDER=%~1"
if not exist "%TARGET_FOLDER%" (
    echo Folder not found: "%TARGET_FOLDER%"
    exit /b
)

pushd "%~dp0%TARGET_FOLDER%"
for %%I in (*.exe *.msi) do (
    echo Installing %%~nxI
    if /I "%%~xI"==".msi" (
        msiexec /i "%%~I"
    ) else (
        start /wait "" "%%~I"
    )
    echo Finished %%~nxI
    echo.
)
popd
exit /b

:setWallpaper
set "SRC_WALLPAPER=%~dp0Media\Maverick Wallpaper.png"

:: Prefer Documents, fallback to C:\EsportsInstaller
set "DEST_DIR=%USERPROFILE%\Documents\Esports Installer\Media"
if not exist "%USERPROFILE%\Documents" (
    set "DEST_DIR=C:\EsportsInstaller\Media"
)

set "DEST_WALLPAPER=%DEST_DIR%\Maverick Wallpaper.png"

if not exist "%SRC_WALLPAPER%" (
    echo Wallpaper not found at "%SRC_WALLPAPER%"
    exit /b
)

mkdir "%DEST_DIR%" 2>nul
copy /y "%SRC_WALLPAPER%" "%DEST_WALLPAPER%" >nul

reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%DEST_WALLPAPER%" /f >nul
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters 1, True

echo Wallpaper copied locally and applied.



popd
exit /b
