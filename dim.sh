#!/bin/bash

# Return input video dimensions with FFprobe
dim=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 data/$1)
echo "Dimensions: $dim"
w=${dim%x*}
h=${dim#*x}

# Detect video orientation
if [ "$w" -gt "$h" ]; then
    echo "Orientation: Horizontal"
elif [ "$w" -lt "$h" ]; then
    echo "Orientation: Vertical"
elif [ "$w" -eq "$h" ]; then
    echo "Orientation: Square"
fi

# Detect video type
if [[ $1 == *".mp4" ]]; then
    ext=".mp4"
    echo "Type: mp4"
elif [[ $1 == *".gif" ]]; then
    ext=".gif"
    echo "Type: gif"
else
    echo "Error: Only .gif and .mp4 file type supported"
    exit 1
fi