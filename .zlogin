#!/bin/bash

if [ "$(tty)" = "/dev/tty1" ];then
    exec start_hyprland.sh
fi
