@echo off
title GramSahay - Government Welfare Schemes Portal
echo ========================================================
echo   GramSahay - Digital Welfare Platform (.NET WebForms)
echo   Government of India Initiative
echo ========================================================
echo.
echo Starting IIS Express on http://localhost:5070/ ...
echo Opening Default.aspx in Google Chrome...
echo.

if exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
    start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" "http://localhost:5070/Default.aspx"
) else (
    start "" "http://localhost:5070/Default.aspx"
)

"C:\Program Files\IIS Express\iisexpress.exe" /path:"%~dp0" /port:5070 /clr:v4.0
pause
