#!/bin/sh

(pidof thunderbird && hyprctl dispatch focuswindow initialclass:Thunderbird) || exec thunderbird "$@"
