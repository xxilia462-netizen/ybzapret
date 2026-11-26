@echo off
title ybzapret-upx

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Run ybzapret.bat as Administrator!
    pause
    exit /b
)

:: Read version from .service\version.txt (default 1.0.3)
set "VERSION=1.0.3"
if exist "%~dp0.service\version.txt" (
    set /p VERSION=<"%~dp0.service\version.txt"
)
title ybzapret-upx v%VERSION%

:MENU
cls
echo =========================================
echo          ybzapret-upx v%VERSION%
echo =========================================
echo.
echo  1. Download / Update bin\ (First Step)
echo  2. Run Bypass (Choose ALT 1-9 / FAKE)
echo  3. Install Background Service (ALT 9)
echo  4. Auto-Benchmark Strategies (TLS/Socket)
echo  5. Apply System Hosts (GitHub/TG/Discord)
echo  6. Stop Bypass & Remove Service
echo  0. Exit
echo.
echo =========================================
set /p choice="Select (0-6): "

if "%choice%"=="1" ( powershell -ExecutionPolicy Bypass -File "%~dp0utils\update_bin.ps1" & goto MENU )
if "%choice%"=="2" ( call "%~dp0utils\strategies.bat" & goto MENU )
if "%choice%"=="3" ( call "%~dp0.service\service_install.bat" & goto MENU )
if "%choice%"=="4" ( powershell -ExecutionPolicy Bypass -File "%~dp0utils\test_ybzapret.ps1" & goto MENU )
if "%choice%"=="5" ( powershell -ExecutionPolicy Bypass -File "%~dp0.service\apply_hosts.ps1" & goto MENU )
if "%choice%"=="6" ( call "%~dp0.service\stop_bypass.bat" & goto MENU )
if "%choice%"=="0" exit /b

goto MENU
