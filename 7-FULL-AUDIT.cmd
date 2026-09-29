@echo off
cd /d "%~dp0"
echo.
echo Demo Bank BI Monitoring - Full Offline Audit v2.1.0
echo ==================================================
python tools\full_audit.py
set RC=%ERRORLEVEL%
echo.
if not "%RC%"=="0" (
  echo FULL AUDIT FAILED. Review the FAIL line above.
) else (
  echo FULL AUDIT PASSED. No bank SQL, no external AI API and no real email were used.
)
pause
exit /b %RC%
