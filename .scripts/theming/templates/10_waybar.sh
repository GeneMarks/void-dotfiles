#!/bin/bash

THEME_FILE="$1"
CONFIG_FILE="$HOME/.config/waybar/colors.css"

while IFS="=" read -r key value; do
    if [[ "$key" =~ ^base[0-9A-F]+$ ]]; then
        sed -i "s|@define-color $key .*;|@define-color $key $value;|" "$CONFIG_FILE"
    fi
done < "$THEME_FILE"

pkill -x waybar
hyprctl dispatch exec waybar
