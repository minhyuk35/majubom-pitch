@echo off
rem Majubom booth loop - opens index.html fullscreen (kiosk) with autoplay.
rem Exit: Alt+F4
set "HTML=%~dp0index.html"
set "URL=file:///%HTML:\=/%"

set "CHROME=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if not exist "%CHROME%" set "CHROME=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if not exist "%CHROME%" set "CHROME=%LocalAppData%\Google\Chrome\Application\chrome.exe"
if exist "%CHROME%" (
  start "" "%CHROME%" --kiosk --autoplay-policy=no-user-gesture-required --user-data-dir="%TEMP%\majubom-booth" --no-first-run --no-default-browser-check --disable-session-crashed-bubble --disable-infobars "%URL%"
  exit /b
)

set "EDGE=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if not exist "%EDGE%" set "EDGE=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
if exist "%EDGE%" (
  start "" "%EDGE%" --kiosk "%URL%" --edge-kiosk-type=fullscreen --no-first-run --autoplay-policy=no-user-gesture-required
  exit /b
)

echo Chrome / Edge not found. Open index.html in a browser and press F.
pause
