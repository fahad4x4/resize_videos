#!/bin/bash

# Author: Fahad Alghathbar
# Created on: April 14, 2023

if ! command -v ffmpeg > /dev/null 2>&1; then
    echo "ffmpeg is not installed"
    exit 1
fi

shopt -s nullglob nocaseglob
files=( *.mp4 )
if [ ${#files[@]} -eq 0 ]; then
    echo "No mp4 files found in this folder"
    exit 1
fi

mkdir -p resized
for file in "${files[@]}"; do
    echo "Resizing $file"
    # -2 keeps the height even, which H.264 requires
    ffmpeg -nostdin -loglevel error -y -i "$file" -vf "scale=trunc(iw/4)*2:-2" "resized/$file"
done
