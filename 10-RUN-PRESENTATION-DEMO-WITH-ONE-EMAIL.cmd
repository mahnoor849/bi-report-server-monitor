@echo off
setlocal
cd /d "%~dp0"
echo.
echo Demo Bank BI Monitoring - Executive Demo + ONE Real UAT Email
echo ===============================================================
echo Synthetic monitoring data. No bank SQL. Operational mail stays OFF.
echo One real UAT group message can be sent only after UI confirmation.
echo.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\scripts\START-PRESENTATION-EMAIL-DEMO.ps1"
endlocal
