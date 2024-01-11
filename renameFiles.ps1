# Set the directory you want to iterate over
$directory = "insert file path here"

# Use Get-ChildItem to locate all files/folders in the directory
Get-ChildItem -Path $directory -Recurse | ForEach-Object {
    $item = $_.FullName
    Write-Host "Renaming file: $item"
    
    # Extract the file's directory and name
    $item_dir = (Get-Item $item).Directory.FullName
    $item_name = (Get-Item $item).BaseName

    if ($item_name -match "[\\/\|:*?`"<>\\,]") {
        # Replace problematic characters with underscores (you can choose another character)
        $new_name = $item_name -replace "[\\/\|:*?`"<>\\,]", "_"

        # Construct the new item path
        $new_item = Join-Path -Path $item_dir -ChildPath $new_name

        # Rename the item
        Rename-Item -Path $item -NewName $new_name -Force
        Write-Host "Renamed: $item -> $new_item"
    }
}