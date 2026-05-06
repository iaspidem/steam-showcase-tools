#!/bin/bash

# Return input video dimensions with FFprobe
ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 data/$1
