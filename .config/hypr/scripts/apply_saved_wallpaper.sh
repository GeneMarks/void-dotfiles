#!/bin/bash

if [ -f $MY_HYPR_CONF/wallpaper.conf ]; then
    pkill swaybg
    swaybg -i "$(cat $MY_HYPR_CONF/wallpaper.conf)" &
fi
