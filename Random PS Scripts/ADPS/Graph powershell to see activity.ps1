# Import the required module
Import-Module -Name Microsoft.Graph.Authentication, Microsoft.Graph.DeviceManagement

# Define the path to the CSV file
$csvPath = "C:\users\jeh\Downloads\LAPS.csv"

# Read the CSV file
$csvData = Import-Csv -Path $csvPath

# Iterate through each row in the CSV
foreach ($row in $csvData) {
    # Get the device Name from the CSV row
    $deviceName = $row.DeviceName

    # Get the device activity using Get-MgDevice
    $deviceActivity = Get-MgDevice -Filter "displayName eq '$deviceName'"

    # Process the device activity
    # Replace this with your own logic
    if ($deviceActivity) {
        Write-Host "Device with Name $deviceName has activity."
    } else {
        Write-Host "Device with Name $deviceName has no activity."
    }
}