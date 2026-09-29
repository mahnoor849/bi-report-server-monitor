@echo off
setlocal
cd /d "%~dp0"
echo.
echo Demo Bank BI Monitoring - Presentation Readiness Check
echo =======================================================
echo Package checks use no bank SQL, no external AI API and no email. Final step checks the local Ollama/Qwen service only.
echo.
python .\tools\self_test.py
if errorlevel 1 goto :fail
echo.
python .\tools\full_audit.py
if errorlevel 1 goto :fail
echo.
echo STEP 3/3 - Local Ollama / Qwen readiness
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\scripts\CHECK-OLLAMA-QWEN.ps1"
if errorlevel 1 goto :ai_fail
echo.
echo =======================================================
echo PRESENTATION READINESS PASSED
echo Start the demo with: 0-RUN-LOCAL-DEMO.cmd
echo =======================================================
pause
exit /b 0
:ai_fail
echo.
echo PRESENTATION READINESS FAILED - local Ollama/Qwen is not ready.
echo Run: 8-CHECK-OLLAMA-QWEN.cmd
echo Then confirm your installed model with: ollama list
pause
exit /b 1
:fail
echo.
echo PRESENTATION READINESS FAILED - review the FAIL line above.
pause
exit /b 1
