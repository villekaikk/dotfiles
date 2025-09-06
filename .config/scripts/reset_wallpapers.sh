#!/usr/bin/env bash

python ~/.config/scripts/wallpaper_lotto.py

wpCacheDir=$HOME/.cache/wallpapers

# Mathces wallpapers despite of file extension
wallpaper1=$(find $wpCacheDir/wallpaper_1.*)
wallpaper2=$(find $wpCacheDir/wallpaper_2.*)

# Set as an env var so hyprlock can access the wallpaper, despite the file extension
export WALLPAPER=$wallpaper1

if [ -f "/usr/bin/wal" ]; then
		wal -tnq -i $wallpaper1
fi

swww img -o DP-3 --resize crop -t wipe --transition-step 200 --transition-duration 1 --transition-angle 225 --transition-fps 144 $wallpaper1
swww img -o DP-1 --resize crop -t wipe --transition-step 200 --transition-duration 1 --transition-angle 315 --transition-fps 144 $wallpaper2 
