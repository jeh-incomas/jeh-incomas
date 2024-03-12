# Define the source and destination folders
$sourceFolder = "C:\Path\To\Your\Source\Folder"
$destinationFolder = "C:\Path\To\Your\Destination\Folder"

# Get all .txt files in the subfolders (including sub-subfolders)
Get-ChildItem -Path $sourceFolder -Recurse -File -Filter "*.txt" | ForEach-Object {
    # Check if the file is older than a certain number of days (you can adjust this threshold)
    if ($_.LastWriteTime -lt (Get-Date).AddDays(-31)) {
        # Move the file to the destination folder
        Move-Item -Path $_.FullName -Destination $destinationFolder
        Write-Host "Moved file: $($_.Name)" >> C:\FileValidation\log.txt
    }
}

# Get all .csv files in the subfolders (including sub-subfolders)
Get-ChildItem -Path $sourceFolder -Recurse -File -Filter "*.csv" | ForEach-Object {
    # Check if the file is older than a certain number of days (you can adjust this threshold)
    if ($_.LastWriteTime -lt (Get-Date).AddDays(-31)) {
        # Move the file to the destination folder
        Move-Item -Path $_.FullName -Destination $destinationFolder
        Write-Host "Moved file: $($_.Name)" >> C:\FileValidation\log.txt
    }
}
