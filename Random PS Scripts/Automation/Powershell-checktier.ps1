# Get all users whose names end with "_tier2"
$users = Get-ADUser -Filter { Name -like '*_tier2' }

# Group to check membership
$group = "TIER-2"

# Email settings
$smtpServer = "smtp.yourserver.com"
$from = "admin@yourdomain.com"
$to = "recipient@yourdomain.com"
$subject = "User not in TIER-2 Group"

foreach ($user in $users) {
    $isMember = Get-ADGroupMember -Identity $group | Where-Object { $_.SamAccountName -eq $user.SamAccountName }
    
    if ($isMember) {
        Write-Output "$($user.Name) is a member of $group"
    } else {
        Write-Output "$($user.Name) is NOT a member of $group"
        
        # Send email notification
        $body = "$($user.Name) is NOT a member of $group"
        Send-MailMessage -SmtpServer $smtpServer -From $from -To $to -Subject $subject -Body $body
    }
}