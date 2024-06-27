# Specify the URL of the file
$url = "http://vmwiniis01.incom.as/file/sysmon.zip"
$url1 = "http://vmwiniis01.incom.as/done"
# Specify the path where the file will be saved
$output = "C:\Temp\sysmon.zip"
# Use Invoke-WebRequest cmdlet to download the file
Invoke-WebRequest -Uri $url -OutFile $output
# Unzip the downloaded file
Expand-Archive -Path $output -DestinationPath "C:\Temp"
# Remove the downloaded zip file
Remove-Item $output
# Run the extracted file
Start-Process "C:\Temp\Sysmon\install\Update-Sysmon-Config.cmd"
# Notify the server that the download and install is complete is complete
Invoke-WebRequest -Uri $url1