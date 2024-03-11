# Define the list of folders
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

# CPR number pattern (Danish format: DDMMYY-XXXX)
$pattern = '\b\d{6}-\d{4}\b'

# Output file path
$outputFile = "C:\users\file_admin\desktop\exports\powershell-cpr.txt"

# Ensure output directory exists
$outputDir = Split-Path $outputFile
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir
}

# Search each folder
foreach ($folder in $folders) {
    # Get all files in the folder and its subfolders
    $files = Get-ChildItem -Path $folder -Recurse -File

    foreach ($file in $files) {
        # Check if the file contains the CPR pattern
        $content = Get-Content $file.FullName
        if ($content -match $pattern) {
            # Append the file path to the output file
            "CPR number found in file: $($file.FullName)" | Out-File -Append -FilePath $outputFile
        }
    }
}
