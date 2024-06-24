#!/bin/bash

HYPRIDLE_PID=$(pidof hypridle)

if [ -n "$HYPRIDLE_PID" ]; then
    pkill -x hypridle
fi

notify-send "Hyprland" "Hypridle disabled" -h string:x-canonical-private-synchronous:sys-notify -t 3000
