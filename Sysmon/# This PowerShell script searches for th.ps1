# This PowerShell script searches for the words "credentials", "passwords", or "pass" in files within a specified directory and outputs the results to a CSV file and sends it via email.

# Define the directory to search
$directory = "X:\"

# Define the output CSV file
$outputCsv = "C:\Temp\CredOutput.csv"

# Initialize an array to store the results
$results = @()

# Get all files in the directory
$files = Get-ChildItem -Path $directory -Recurse -File

# Loop through each file and search for the keywords
foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName
    foreach ($line in $content) {
        if ($line -match "credentials" -or $line -match "passwords" -or $line -match "pass") {
            $results += [PSCustomObject]@{
                File = $file.FullName
                Line = $line
            }
        }
    }
}

# Export the results to a CSV file
$results | Export-Csv -Path $outputCsv -NoTypeInformation
            Write-Output "File: $($file.FullName)"
            Write-Output "Line: $line"
            Write-Output "-------------------------"