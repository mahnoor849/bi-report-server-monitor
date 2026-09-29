@echo off
cd /d "%~dp0"
if not exist config\bank.json (
  echo config\bank.json is missing. Run 2-CREATE-BANK-CONFIG.cmd first.
  pause
  exit /b 2
)
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\scripts\START-BANK.ps1"
pause
