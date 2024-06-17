#!/bin/bash

WALLPAPER_DIR=~/wallpapers
WALLPAPER_CONF=$MY_HYPR_CONF/wallpaper.conf

source $MY_HYPR_SCRIPTS/bemenu/bemenu_default_params.sh

SELECTED_WALLPAPER=$(ls $WALLPAPER_DIR | bemenu ${BEMENU_DEFAULT_PARAMS[@]} \
    --list 20 \
    --width-factor 0.18 \
    --prompt 'wallpapers')

if [ -n "$SELECTED_WALLPAPER" ]; then
    SELECTED_WALLPAPER=$WALLPAPER_DIR/$SELECTED_WALLPAPER

    pkill swaybg
    swaybg -i "$SELECTED_WALLPAPER" &
    echo "$SELECTED_WALLPAPER" > $WALLPAPER_CONF
fi
