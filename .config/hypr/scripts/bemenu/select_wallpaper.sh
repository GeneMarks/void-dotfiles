#!/bin/bash

WALLPAPERS_DIR="$HOME/wallpapers"
WALLPAPER="$HOME/.cache/current_wallpaper"

SELECTED_WALLPAPER=$(ls $WALLPAPERS_DIR | $MY_HYPR_SCRIPTS/bemenu/run_bemenu.sh \
    --list 20 \
    --width-factor 0.18 \
    --prompt 'wallpapers')

if [ -n "$SELECTED_WALLPAPER" ]; then
    SELECTED_WALLPAPER=$WALLPAPERS_DIR/$SELECTED_WALLPAPER

    ln -sf "$SELECTED_WALLPAPER" "$WALLPAPER"
    pkill swaybg
    swaybg -i "$WALLPAPER" &
fi
