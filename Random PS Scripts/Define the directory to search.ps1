# Define the directory to search
$directory = "xxxx directory"

# Get all files in the directory
$files = Get-ChildItem -Path $directory -File

# Loop through each file and search for the word "password"
foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName
    if ($content -match "password") {
        Write-Output "Password found in file: $($file.FullName)"
    }
}
