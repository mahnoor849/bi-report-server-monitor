@echo off
cd /d "%~dp0"
if not exist config\bank.json (
  echo config\bank.json is missing. Run 2-CREATE-BANK-CONFIG.cmd first.
  pause
  exit /b 2
)
echo.
echo CONTROLLED UAT GROUP EMAIL TEST
echo --------------------------------
echo This opens the dashboard with ONE real UAT group email allowed for this session.
echo Operational alerts stay disabled.
echo.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\scripts\START-ONE-UAT-EMAIL-TEST.ps1"
pause
