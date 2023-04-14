#!/bin/bash

# Author: Fahad Alghathbar
# Created on: April 14, 2023

mkdir resized
for file in *.mp4
do
    echo "Resizing $file"
    ffmpeg -i "$file" -vf scale=iw/2:-1 "resized/$file"
done
