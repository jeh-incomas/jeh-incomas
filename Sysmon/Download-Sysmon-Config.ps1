###############################################
#       download Sysmon config file           # 
###############################################
#
#
# Download the Sysmonconfig zip file to C:\Windows\Sysmon\sysmonconfig.zip

[Net.ServicePointManager]::SecurityProtocol = `
    [Net.SecurityProtocolType]::Tls12 ;
Invoke-WebRequest `
    -Uri 'https://networkforensic.dk/SecurityOnion/Files/sysmonconfig.zip' `
    -OutFile 'C:\Windows\Sysmon\sysmonconfig.zip' ;

# Expand the sysmonconfig.zip file and overwrite current zip file in location
Expand-Archive -Force -Path C:\Windows\Sysmon\sysmonconfig.zip -DestinationPath C:\Windows\Sysmon

# Kør Update-Sysmon-Config.cmd
Start-Process -FilePath "C:\Windows\Sysmon\Update-Sysmon-Config.cmd"
#
#
exit