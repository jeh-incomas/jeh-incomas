Made by Networkforensic.dk

Download latest Sysmon version:
https://learn.microsoft.com/en-us/sysinternals/downloads/sysmon


-------------------------------------------------------------------------
Exampel for installation of Sysmon: 64 Bit version

Unpack content from "Sysmon_15.15_Config_51.zip" to C:\Windows\Sysmon

With admin rights run Install-Sysmon.cmd
...This will remove any installed version and install the latest version...

Be aware that Sysmon64.exe has been renamed to TaskhostView.exe

-------------------------------------------------------------------------
Example to uninstall Sysmon:

With admin rights run Uninstall-Sysmon.cmd

-------------------------------------------------------------------------
Example to update Sysmon config:

With admin rights run Update-Sysmon-Config.cmd

-------------------------------------------------------------------------
Manual commands for Sysmon:

- Start a command promt with admin rights
- Place the sysmon folder on C:\Windows\Sysmon
- Navigate to C:\Windows\Sysmon

Installation:
TaskhostView.exe -accepteula –i sysmonconfig.xml

Update a running config:
TaskhostView.exe -c sysmonconfig.xml

To uninstall sysmon:
TaskhostView.exe -u

To uninstall sysmon with force:
TaskhostView.exe -u force

Print configuration schema definition.
TaskhostView.exe -u force

Print configuration schema definition
TaskhostView.exe -s