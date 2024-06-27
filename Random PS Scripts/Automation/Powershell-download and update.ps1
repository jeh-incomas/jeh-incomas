# Check for and download available updates
$session = New-Object -ComObject Microsoft.Update.Session
$downloader = $session.CreateUpdateDownloader()
$updates = $downloader.Search("IsInstalled=0")
$downloader.Download($updates)

# Install downloaded updates
$installer = New-Object -ComObject Microsoft.Update.Installer
$installer.Install()

# Reboot if required
$rebootRequired = $installer.RebootRequired
if ($rebootRequired) {
    Write-Host "Rebooting the system..."
    shutdown.exe /r /t 0
} else {
    Write-Host "Updates installed successfully."
}