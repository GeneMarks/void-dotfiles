#!/bin/bash

WALLPAPERS_DIR="$HOME/wallpapers"
WALLPAPER="$HOME/.cache/current_wallpaper"

SELECTED_WALLPAPER=$(find "$WALLPAPERS_DIR" -type f -printf "%f\n" | sort | "$MY_HYPR_SCRIPTS"/bemenu/run_bemenu.sh \
    --list 24 \
    --width-factor 0.16 \
    --prompt 'wallpapers')

if [ -n "$SELECTED_WALLPAPER" ]; then
    SELECTED_WALLPAPER="$WALLPAPERS_DIR/$SELECTED_WALLPAPER"

    ln -sf "$SELECTED_WALLPAPER" "$WALLPAPER"
    pkill swaybg
    swaybg -i "$WALLPAPER" &
fi
