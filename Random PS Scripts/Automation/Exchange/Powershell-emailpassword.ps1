#Login information for Microsoft Graph
$ApplicationId = ""
$SecuredPassword = ""
$tenantID = ""

$SecuredPasswordPassword = ConvertTo-SecureString `
-String $SecuredPassword -AsPlainText -Force

$ClientSecretCredential = New-Object `
-TypeName System.Management.Automation.PSCredential `
-ArgumentList $ApplicationId, $SecuredPasswordPassword

Connect-MgGraph -TenantId $tenantID -ClientSecretCredential $ClientSecretCredential

#Set the notification threshold
$NotificationThreshold = 7
$PasswordExpiryThreshold = 365

#Get all users that have Aarhus in city attribute
$AllUsers = Get-MgUser -Filter "city eq 'Aarhus'" -Property DisplayName, UserPrincipalName,Mail,UserType, AccountEnabled,PasswordPolicies,lastPasswordChangeDateTime

ForEach ($User in $AllUsers) 
{
    #Skip disabled accounts and users with password never expires and guest user
    If (!$User.AccountEnabled -or $User.PasswordPolicies -contains "xDisablePasswordExpiration" -or $User.userType -eq "Guest") {
        continue
    }

    #Get users password Expiry Date
    $PasswordExpiryDate = $User.lastPasswordChangeDateTime.AddDays($PasswordExpiryThreshold)
 
    #Calculate the remaining days
    $RemainingDays = ($PasswordExpiryDate - (Get-Date)).Days
 
    #Check if the remaining days are within the notification threshold
    If ($RemainingDays -le $NotificationThreshold) {
        #Send an email notification to the user
        $EmailBody = "
            Hello $($User.DisplayName),
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
 
    $MailParams = @{
        Message = @{
            Subject = "(INCOM) Your password expires soon"
            Importance = "High"
            Body = @{
                ContentType = "html"
                Content = $EmailBody
            }
            ToRecipients = @(
                @{
                    EmailAddress = @{
                        Address = $User.Mail
                    }
                }
            )
        }
    }
    #Send the email using Microsoft Graph
    Send-MgUserMail -UserId $User.Mail -BodyParameter $MailParams
    }
}

##########################################################
#                       Log script                       #
##########################################################

$logtime=Get-Date
echo "Last runtime '$logtime' " >> C:\Automation\log.txt