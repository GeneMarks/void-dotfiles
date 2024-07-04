#!/bin/sh

(pidof ncmpcpp && hyprctl dispatch focuswindow initialtitle:ncmpcpp) || exec foot --title "ncmpcpp" -e ncmpcpp
