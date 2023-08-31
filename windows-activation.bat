@echo off
color c7
title Windows Activation by Nyne

cscript //nologo "%windir%\System32\slmgr.vbs" /dli | find "License Status: Licensed" > nul
if errorlevel 1 (
    goto Menu
) else (
    goto Warning
)


:Warning
echo Windows is already activated, meaning you don't need this script.
echo However, you can press "y" to continue.

set /p choice=
if "%choice%"=="y" goto Menu
else (
	exit /b

:menu
cls
echo ========================
echo Please select which edition of windows you're currently on.
echo ========================
echo 1. Home
echo 2. Pro/Enterprise
echo 3. N/A
echo 4. Exit
echo ========================
set /p choice=Enter your edition: 

if "%choice%"=="1" goto HomeAct
if "%choice%"=="2" goto ProEntAct
if "%choice%"=="3" goto NA
if "%choice%"=="4" goto :eof

:HomeAct
cls
echo Home activation has not been filled out yet, returning to main menu.
timeout 2 >nul
goto menu

:ProEntAct
cls
echo Activating...
echo Make sure you don't select any part of the terminal window, as that will pause the script.
timeout 1 >nul
cscript //nologo "%windir%\System32\slmgr.vbs" /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX >nul 2>&1
cscript //nologo "%windir%\System32\slmgr.vbs" /skms kms8.msguides.com >nul 2>&1
cscript //nologo "%windir%\System32\slmgr.vbs" /ato >nul 2>&1
echo You should now be activated. Press any key to exit.
pause >nul
exit /b

:NA
cls
echo This option has not been filled out yet, returning to main menu.
timeout 2 >nul
goto :menu
