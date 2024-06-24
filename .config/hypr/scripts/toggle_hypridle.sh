#!/bin/bash

HYPRIDLE_PID=$(pidof hypridle)

if [ -n "$HYPRIDLE_PID" ]; then
    pkill -x hypridle
    MESSAGE="Hypridle disabled"
else
    hypridle &
    MESSAGE="Hypridle enabled"
fi

notify-send "Hyprland" "$MESSAGE" -h string:x-canonical-private-synchronous:sys-notify -t 3000
