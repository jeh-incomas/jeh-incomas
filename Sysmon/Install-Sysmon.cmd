CLS
@echo off
ECHO.
TITLE Start Sysmon installation
ECHO ****************************************
ECHO *         Sysmon Installation          *
ECHO ****************************************
ECHO.
@Echo Removing old version first
ECHO.
@Echo Remove Sysmon
"C:\Windows\Sysmon\TaskhostView.exe" -u force
net stop eventlog /y
del c:\windows\TaskhostView.exe
reg delete HKLM\SYSTEM\CurrentControlSet\Services\TaskhostView /f
net start eventlog
ECHO.
ECHO.
@Echo Remove Sysmon driver
Net stop sysmondrv
del c:\windows\sysmondrv.sys
reg delete HKLM\SYSTEM\CurrentControlSet\Services\SysmonDrv /f
ECHO.
@ECHO Installing Sysmon
C:\Windows\Sysmon\TaskhostView.exe -accepteula -i "C:\Windows\Sysmon\sysmonconfig.xml"
ECHO.
@Echo Done
Exit
