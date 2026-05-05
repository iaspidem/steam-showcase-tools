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
elif [ "$2" -eq "$3" ]; then
    echo "Type: Square"
fi

# Check video width
if (( "$2" % 5 != 0 )); then
    echo "Error: Width not divisible by 5"
else # Perform crop
    echo "Performing video crop"
    c=1
    while [ $c -le 5 ]; do # Perform crop 5 times
        #ffmpeg -i data/$1 -vf "crop=" output/c"$c".gif
        echo "Status: c"$c".gif complete"
        c=$((c+1)) # increment counter by 1
    done
fi