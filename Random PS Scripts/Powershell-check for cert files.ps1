# Specify the folders to search
$folders = @(
    "X:\Incomas\All-Shared",
    "X:\Incomas\Compliance",
    "X:\Incomas\Data",
    "X:\Incomas\Environmental Products",
    "X:\Incomas\Finance",
    "X:\Incomas\General",
    "X:\Incomas\IT",
    "X:\Incomas\Legal and Market Access"
    "X:\Incomas\People & Culture",
    "X:\Incomas\Quantitative Solutions",
    "X:\Incomas\Risk",
    "X:\Incomas\Salary",
    "X:\Incomas\SBD",
    "X:\Incomas\Trading"
    "X:\Incomas\US"
)

# Specify the certificate extensions to look for
$extensions = @(
    "*.crt", "*.cer", "*.der", "*.p7b", "*.p7c", "*.p12", "*.pfx", "*.key", "*.csr", "*.req"
)

# Output file path
$outputFile = "C:\Users\file_admin\Desktop\Exports\powershell-cert.txt"

# Clear the output file if it already exists
if (Test-Path $outputFile) {
    Clear-Content $outputFile
}

# Search for certificate files in the specified folders
foreach ($folder in $folders) {
    foreach ($extension in $extensions) {
        $files = Get-ChildItem -Path $folder -Filter $extension -Recurse -File
        foreach ($file in $files) {
            $file.FullName | Out-File -Append $outputFile
        }
    }
}

# Display a message when the search is complete
Write-Host "Certificate search complete. Results saved to $outputFile"
