@echo off
cd /d "%~dp0"
echo.
echo Demo Bank BI Monitoring - Package Self-Test
echo ==========================================
python tools\self_test.py
set RC=%ERRORLEVEL%
echo.
if not "%RC%"=="0" (
  echo SELF-TEST FAILED. Do not continue.
) else (
  echo SELF-TEST PASSED. Next run 2-CREATE-BANK-CONFIG.cmd
)
pause
exit /b %RC%
