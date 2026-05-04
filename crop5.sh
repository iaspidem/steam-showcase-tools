#!/bin/bash

# Get video input file
echo "Enter file name:"
read filename

# Return info on file with FFmpeg
ffmpeg -i data/$filename -hide_banner