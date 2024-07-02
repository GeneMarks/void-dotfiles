#!/bin/sh

if [ "$(tty)" = "/dev/tty1" ];then
    exec $SCRIPTS/hypr/start_hyprland.sh
fi
