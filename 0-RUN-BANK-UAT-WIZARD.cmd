@echo off
cd /d "%~dp0"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\scripts\RUN-BANK-UAT-WIZARD.ps1"
pause
