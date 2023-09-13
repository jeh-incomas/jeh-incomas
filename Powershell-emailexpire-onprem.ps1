#Import AD Module
 Import-Module ActiveDirectory
 
#Create warning dates for future password expiration
$SevenDayWarnDate = (get-date).adddays(7).ToLongDateString()

#Email Variables
$MailSender = " Password AutoBot <sias@incommodities.com>"
$Subject = 'INCOM - Your account password will expire soon'
$EmailBody = "
            Hello,
            <br/><br/>
			Your password expires $remainingDays.</br></br>
 
            It is important that you change your password ASAP to avoid any disruption.</br></br>
                 
            How do I change my password.</br>
             1. If you are not at the Office connect to the VPN(Cisco AnyConnect).</br>
             2. While logged on press CTRL + ALT + DELETE and click Change Password.</br>
             3. Enter your current password, enter and confirm a new password that meets the below password policy. Press Enter</br>
             4. Press CTRL + ALT + DELETE and click Lock.</br>
             5. Unlock your computer with your new password</br></br>
                 
            If you have any questions please contact us via support@in-commodities.com or call us at +45 8180 8805</br></br>
        "
$SMTPServer = 'smtp.office.com'
 
#Find accounts that are enabled and have expiring passwords
$users = Get-ADUser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $False -and PasswordLastSet -gt 0 } `
 -Properties "Name", "EmailAddress", "msDS-UserPasswordExpiryTimeComputed" | Select-Object -Property "Name", "EmailAddress", `
 @{Name = "PasswordExpiry"; Expression = {[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed").tolongdatestring() }}
 
#check password expiration date and send email on match
foreach ($user in $users) {
     if ($user.PasswordExpiry -eq $SevenDayWarnDate) {
         $days = 7
 
         Send-MailMessage -To $user.EmailAddress -From $MailSender -SmtpServer $SMTPServer -Subject $Subject -Body $EmailBody
     }
    else {}
 }

