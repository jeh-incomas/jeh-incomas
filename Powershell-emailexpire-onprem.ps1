#Import AD Module
Import-Module ActiveDirectory
 
#Create warning dates for future password expiration
$SevenDayWarnDate = (get-date).adddays(7).ToLongDateString()

#Email Variables
$Credential="sias@in-commodities.com"
$SMTPServer = 'smtp.office365.com'
$MailSender = "Password AutoBot <sias@incommodities.com>"
$Subject = 'INCOM - Your account password will expire soon'
$EmailBody = "
    Hello $($user),
    Your password expires $remainingDays.
    It is important that you change your password ASAP to avoid any disruption.      
    How do I change my password.
        1. If you are not at the Office connect to the VPN(Cisco AnyConnect).
        2. While logged on press CTRL + ALT + DELETE and click Change Password.
        3. Enter your current password, enter and confirm a new password that meets the below password policy. Press Enter
        4. Press CTRL + ALT + DELETE and click Lock.
        5. Unlock your computer with your new password            
    If you have any questions please contact us via support@in-commodities.com or call us at +45 8180 8805"

#Find accounts that are enabled and have expiring passwords
$users = Get-ADUser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $False -and PasswordLastSet -gt 0 } `
 -Properties "Name", "EmailAddress", "msDS-UserPasswordExpiryTimeComputed" | Select-Object -Property "Name", "EmailAddress", `
 @{Name = "PasswordExpiry"; Expression = {[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed").tolongdatestring() }}
 
#Script for giving the user how much time is left
$remainingDays="Get-ADuser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $False -and PasswordLastSet -gt 0"

#check password expiration date and send email on match
foreach ($user in $users) {
     if ($user.PasswordExpiry -eq $SevenDayWarnDate) {
         $days = 7
         Send-MailMessage -To "jeh@in-commodities.com" -From $MailSender -SmtpServer $SMTPServer -Subject $Subject -Body $EmailBody -UseSsl -Port 587 -Credential $Credential
     }
    else {}
 }