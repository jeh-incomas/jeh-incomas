CLS
@echo off
ECHO.
TITLE Start Uninstall Sysmon
ECHO ****************************************
ECHO *         Uninstall Sysmon             *
ECHO ****************************************
ECHO.
@Echo Remove Sysmon
ECHO.
c:\windows\TaskhostView.exe -u force
net stop eventlog /y
Net stop TaskhostView
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
ECHO Sysmon uninstalled......
ECHO.
ECHO Pause
Exit
