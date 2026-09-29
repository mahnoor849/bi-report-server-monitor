@echo off
cd /d "%~dp0"
if exist config\bank.json (
  echo config\bank.json already exists. It was not overwritten.
) else (
  copy /Y config\bank.uat.template.json config\bank.json >nul
  echo Created config\bank.json
)
echo.
echo The confidential SQL Server name is NOT meant to be stored here.
echo Bank preflight/start will ask for it privately at runtime.
echo Only change the ReportServer database name if the bank team confirms a different name.
echo.
start "" notepad.exe config\bank.json
pause
