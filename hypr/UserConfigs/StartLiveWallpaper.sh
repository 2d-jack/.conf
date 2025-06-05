#!/bin/bash

# Folder containing live wallpapers
wall_dir="$HOME/Videos/live-wallpapers"

# Get a random .mp4 file from the folder
video=$(find "$wall_dir" -type f -iname "*.mp4" | shuf -n 1)

# Set it using mpvpaper (HDMI-A-1 is your monitor)
mpvpaper -f -p -o "loop no-audio" HDMI-A-1 "$video"
