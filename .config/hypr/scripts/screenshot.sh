#!/bin/bash

SS_FOLDER="$HOME/Pictures/screenshots"
mkdir -p "$SS_FOLDER"

SS_FILE="$SS_FOLDER/ss_$(date +'%Y-%m-%d-%H%M%S-%3N').png"

if [[ $1 == "full" ]]; then
    grim "$SS_FILE"
else
    SS_IMAGE=$(slurp)
    if [[ -z "$SS_IMAGE" ]]; then
        exit 1
    fi

    grim -g "$SS_IMAGE" "$SS_FILE"
fi

notify-send "Screenshot saved" "Screenshot saved to $SS_FILE" -t 6000
