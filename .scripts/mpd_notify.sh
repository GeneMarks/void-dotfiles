#!/bin/bash

MUSIC_DIR="/mnt/syno/Media/Music"
ALBUM_ART_CACHE="$HOME/.cache/mpd/cover.jpg"

get_album_art() {
    ffmpeg -y -i "$MUSIC_DIR/$(mpc -f %file% current)" -an -c:v copy "$ALBUM_ART_CACHE" &> /dev/null

    # Delete old cache if extraction failed so it isn't in notif
    if [[ $? -ne 0 ]]; then
        rm -f "$ALBUM_ART_CACHE"
    fi
}

while true; do
    STATUS="$(mpc status)"
    if [[ "$STATUS" == *"[playing]"* ]]; then
        get_album_art && notify-send "Now playing" "$(mpc -f '%title%\n%albumartist%' current)" -i "$ALBUM_ART_CACHE" -h string:x-canonical-private-synchronous:music-notify -t 6000
    fi
    mpc current --wait > /dev/null
done
