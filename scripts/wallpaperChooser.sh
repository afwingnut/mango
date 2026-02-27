#!/bin/bash

# Set the wallpapers directory
WALLPAPERS_DIR="$HOME/Pictures/wallpapers"

# Check if the directory exists
if [ ! -d "$WALLPAPERS_DIR" ]; then
    echo "Error: Directory $WALLPAPERS_DIR does not exist"
    exit 1
fi

# Get all files in the directory (excluding subdirectories)
files=("$WALLPAPERS_DIR"/*)

# Check if directory is empty
if [ ${#files[@]} -eq 1 ] && [ ! -f "${files[0]}" ]; then
    echo "Error: No files found in $WALLPAPERS_DIR"
    exit 1
fi

# Filter out directories and keep only files
valid_files=()
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        valid_files+=("$file")
    fi
done

# Check if we have any valid files
if [ ${#valid_files[@]} -eq 0 ]; then
    echo "Error: No valid files found in $WALLPAPERS_DIR"
    exit 1
fi

# Select a random file
random_index=$((RANDOM % ${#valid_files[@]}))
random_wallpaper="${valid_files[$random_index]}"

# Copy the selected wallpaper to wallpaper.jpg in the same directory
cp "$random_wallpaper" "$WALLPAPERS_DIR/wallpaper.jpg"

# Set the wallpaper using swaybg
swaybg -i "$WALLPAPERS_DIR/wallpaper.jpg" -m fill >/dev/null 2>&1 &

echo "Set wallpaper to: $random_wallpaper"
