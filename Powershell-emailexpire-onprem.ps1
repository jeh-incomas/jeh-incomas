#Import AD Module
Import-Module ActiveDirectory

#Define the notification time in days
$DaysToExpire = '7'

#Define the email subject, body, and sender address
$SmtpServer="smtp.office365.com"
$EmailFrom = "sias@incommodities.com"
$EmailSubject = 'INCOM - Your account password will expire soon'
$EmailBody = "Hello {0},
    Your password expires in $DaysLeft day(s)
    It is important that you change your password ASAP to avoid any disruption.      
    How do I change my password.
        1. If you are not at the Office connect to the VPN(Cisco AnyConnect).
        2. While logged on press CTRL + ALT + DELETE and click Change Password.
        3. Enter your current password, enter and confirm a new password that meets the below password policy. Press Enter
        4. Press CTRL + ALT + DELETE and click Lock.
        5. Unlock your computer with your new password            
    If you have any questions please contact us via support@in-commodities.com or call us at +45 8180 8805"

# Assign a fixed value to the maximum password age in days
$MaxPasswordAge = New-TimeSpan -Days "180" # or (Get-Date "2024-04-09")

# Get the user accounts and their password expiration dates, excluding those with password neverexpires
$Users = Get-ADUser -Filter {PasswordNeverExpires -eq $false} -Properties PasswordLastSet, PasswordNeverExpires, PasswordExpired, DisplayName

# Loop through each user account
foreach ($User in $Users) {

    # Skip the user if the password is already expired
    if ($User.PasswordExpired -eq $true) {
        continue
    }

    # Calculate the password expiration date and the remaining days
    if ($User.PasswordLastSet -ne $null) {
        $PasswordExpiryDate = $User.PasswordLastSet.Add($MaxPasswordAge)
        $DaysLeft = (New-TimeSpan -Start (Get-Date) -End $PasswordExpiryDate).Days
    }

    # Check if the remaining days are less than or equal to the notification time
    if ($DaysLeft -le $DaysToExpire) {

        # Get the user's email address
        $EmailTo = $User.EmailAddress

        # Format the email body with the user's name, display name, and the remaining days
        $EmailBodyFormatted = $EmailBody -f $User.Name, $User.DisplayName, $DaysLeft
        #Send an email to the user
        Send-MailMessage -To "jeh@in-commodities.com" -From $EmailFrom -Subject $EmailSubject -Body $EmailBodyFormatted -SmtpServer $SmtpServer  -UseSsl -Port 587 -Credential $Credential
    }
}
