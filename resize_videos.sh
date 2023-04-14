#!/bin/bash
mkdir resized
for file in *.mp4
do
    echo "Resizing $file"
    ffmpeg -i "$file" -vf scale=iw/2:-1 "resized/$file"
done
