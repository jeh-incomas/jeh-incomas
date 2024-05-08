# Powershell script to check computer last activity status using Microsoft Graph API
# Import the required modules
Install-Module -Name Microsoft.Graph.Authentication -Force
Install-Module -Name Microsoft.Graph.PowerShell -Force

# Authenticate to Microsoft Graph API
Connect-MgGraph -Scopes "User.Read.All"

# Read the CSV file
$computers = Import-Csv -Path "C:\Users\Jeh\Downloads\LAPS.csv"

# Iterate through each computer
foreach ($computer in $computers) {
    $computerName = $computer.Name

    # Query Microsoft Graph API to get the last active date
    $lastActiveDate = Get-MgDevice -Property  $computer | Select-Object -ExpandProperty DisplayName, LastActivityDateTime 

    # Output the result
    Write-Output "Computer: $computerName, Last Active Date: $lastActiveDate"
}

# Disconnect from Microsoft Graph API
Disconnect-MgGraph

Get-MgDevice -Property DisplayName=$computer | Select-Object -ExpandProperty DisplayName, LastActivityDateTime 