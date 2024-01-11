#!/bin/bash

# Set the directory you want to iterate over
directory="insert path here"

# Use the 'find' with -depth flag command to locate all files/folders in the directory
find "$directory" -depth | while read -r item; do
    echo "Renaming file: $file"
    # Extract the file's directory and name
    item_dir=$(dirname "$item")
    item_name=$(basename "$item")

    if [[ "$item_name" =~ [\\/\|:*?\"\>\<] ]]; then
    
        # Replace problematic characters with underscores (you can choose another character)
        new_name=$(echo "$item_name" | tr -d '/\|:*?"<>\\')

        # Construct the new item path
        new_item="$item_dir/$new_name"

        # Rename the item
        mv "$item" "$new_item"
        echo "Renamed: $item -> $new_item"
    fi
done