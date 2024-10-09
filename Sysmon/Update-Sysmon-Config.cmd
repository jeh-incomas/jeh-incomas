CLS
@echo off
ECHO.
TITLE Start Update Sysmon config
ECHO ****************************************
ECHO *         Sysmon config update         *
ECHO ****************************************
ECHO.
@Echo Starting Update
"C:\Windows\Sysmon"\TaskhostView.exe -c "C:\Windows\Sysmon\sysmonconfig.xml"
echo Config update done
echo Stopping winlogbeat service
sc Stop winlogbeat
timeout 15
sc start winlogbeat
echo Winlogbeat Service started
timeout 5
echo Checking service states
sc query "TaskhostView"
sc query "Winlogbeat"
pause
Exit
