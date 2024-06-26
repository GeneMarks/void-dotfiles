#!/bin/bash

if [ -f "$HOME/.cache/current_wallpaper" ]; then
    pkill swaybg
    swaybg -i "$HOME/.cache/current_wallpaper" &
fi
