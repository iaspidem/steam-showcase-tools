#!/bin/bash

# Get video input file
echo "Enter file path:"
read filepath

# Return info on file with FFmpeg
ffmpeg -i $filepath -hide_banner