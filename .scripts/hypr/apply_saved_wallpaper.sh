#!/bin/sh

if [ -f "$HOME/.cache/current_wallpaper" ]; then
    pkill swaybg
    swaybg --mode fill -i "$HOME/.cache/current_wallpaper" &
fi
