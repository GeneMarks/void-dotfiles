#!/bin/bash

WALLPAPERS_DIR="$HOME/wallpapers"

SELECTED_WALLPAPER=$(find "$WALLPAPERS_DIR" -type f -printf "%f\n" | sort | "$SCRIPTS/bemenu/run_bemenu.sh" \
    --list 24 \
    --width-factor 0.16 \
    --prompt "wallpapers")

if [ -n "$SELECTED_WALLPAPER" ]; then
    "$SCRIPTS/theming/apply_wallpaper.sh" "$SELECTED_WALLPAPER"
fi
