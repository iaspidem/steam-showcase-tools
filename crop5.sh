#!/bin/bash

# Get video input file
#echo "Enter file name:"
#read filename

# Return info on file with FFmpeg
ffmpeg -i data/$1 -hide_banner
echo "Dimensions: "$2"x"$3""