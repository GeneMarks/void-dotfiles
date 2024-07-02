#!/bin/sh

HYPRIDLE_PID=$(pidof hypridle)

if [ -z "$HYPRIDLE_PID" ]; then
    hypridle &
fi

notify-send "Hyprland" "Hypridle enabled" -h string:x-canonical-private-synchronous:sys-notify -t 3000
