@echo off
cd /d "%~dp0"
echo.
echo Demo Bank BI Monitoring - Handover Audit v2.1.0
echo ==================================================
echo Offline documentation/package consistency checks only.
echo.
python tools\handover_audit.py
set RC=%ERRORLEVEL%
echo.
if not "%RC%"=="0" (
  echo HANDOVER AUDIT FAILED. Fix the FAIL item(s) before transfer.
) else (
  echo HANDOVER AUDIT PASSED. Complete HANDOVER-CHECKLIST.md before ownership transfer.
)
pause
exit /b %RC%
