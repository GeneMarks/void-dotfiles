#!/bin/sh

(pidof musikcube && hyprctl dispatch focuswindow initialtitle:musikcube) || exec foot -T "musikcube" -e musikcube "$@"
