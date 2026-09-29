@echo off
setlocal
cd /d "%~dp0"
echo.
echo Demo Bank BI Monitoring - Ollama / Qwen Readiness Check
echo ============================================================
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\scripts\CHECK-OLLAMA-QWEN.ps1"
echo.
pause
