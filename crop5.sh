#!/bin/bash

# Return input video dimensions with FFprobe
dim=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 data/$1)
echo "Dimensions: $dim"
w=${dim%x*}
h=${dim#*x}
#echo "$w pixel width"
#echo "$h pixel height"
#exit 1

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

# Check video width
if (( "$w" % 5 != 0 )); then
    echo "Error: Width not divisible by 5"
    exit 1
else # Perform crop
    echo
    echo "Performing video crop..."
    wc=$(($w / 5)) # width of crop
    if (( "$wc" < 100 )); then
        echo "Error: video resolution too low"
    fi
    x=0 # x position of crop
    end=0 # end point of crop
    c=1 # counter
    while [ $c -le 5 ]; do # Perform crop 5 times
        outfile="c${c}${ext}" # Name of output file
        echo
        echo "Crop size: "$wc"x"$h""
        end=$((x+wc))
        echo "Crop position: "$x"-"$end""
        #ffmpeg -i data/$1 -vf "crop=" output/c"$c".gif
        echo "Status: $outfile complete"
        c=$((c+1)) # increment counter by 1
        x=$((x+wc)) # increment x position by width
    done
fi