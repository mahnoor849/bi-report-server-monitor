@echo off
setlocal
cd /d "%~dp0"
echo.
echo Demo Bank BI Monitoring - Local Demo / Presentation Rehearsal
echo ==============================================================
echo Uses synthetic data only. No bank SQL. No external APIs. No email.
echo Local Qwen2.5:3B via Ollama is used automatically when Ollama is running.
echo.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\scripts\START-DEMO-BANK-UI.ps1"
endlocal
