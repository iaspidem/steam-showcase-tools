#!/bin/bash

# Get video input file
#echo "Enter file name:"
#read filename

# Return info on file with FFmpeg
ffmpeg -i data/$1 -hide_banner
echo "Dimensions: "$2"x"$3""

# Detect video type
if [ "$2" -gt "$3" ]; then
    echo "Type: Horizontal"
elif [ "$2" -lt "$3" ]; then
    echo "Type: Vertical"
else
    echo "Type: Square"
fi