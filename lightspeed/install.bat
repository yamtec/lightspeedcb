@echo off
echo Welcome to installation.
pause
echo "Installing in %LOCALAPPDATA%\LCAB\"
if not exist "%LOCALAPPDATA%\LCAB\NUL" (mkdir "%LOCALAPPDATA%\LCAB\" && echo Install Directory Created.) else (echo Already Installed. && pause && exit)
timeout 1 > nul
echo Fetching sources from github...
timeout 1 > nul
cd %localappdata%\LCAB\
curl -LO https://raw.githubusercontent.com/gitclone93/blockerbypass/main/lightspeed/opener.vbs
curl -LO https://raw.githubusercontent.com/gitclone93/blockerbypass/main/lightspeed/killer.bat
if %ERRORLEVEL% NEQ 0 (echo Error. Please Check your Internet Connection and try again. && del /f /s /q %localappdata%\LCAB\ && pause && exit)
cd "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"
echo Creating Entry in Startup Folder...
timeout 1 > nul
echo wscript %localappdata%\LCAB\opener.vbs %localappdata%\LCAB\killer.bat > execlcabonstartup.bat
timeout 1 > nul
echo Registering in Task Scheduler...
echo Please Enter your Password when Prompted.
timeout 1 > nul
schtasks /create /sc MINUTE /tn lsk /tr '"%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\execlcabonstartup.bat"' /f /ru %USERNAME% /rp *
echo Installtion Completed Successfully.

:choice
set /P c=Run Now[Y/N]?
if /I "%c%" EQU "Y" goto :yes
if /I "%c%" EQU "N" goto :no
goto :choice

:yes
schtasks /run /tn lsk /i
echo Thanks for Installing. Check back on the gitclone93/lighspeedcb github repository for updates.
timeout 2 > nul
pause
exit

:no
echo Thanks for Installing. Check back on the gitclone93/lightspeedcb github repository for updates.
timeout 2 > nul
pause
exit





