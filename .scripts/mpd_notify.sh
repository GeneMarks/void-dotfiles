#!/bin/bash

MUSIC_DIR="/mnt/syno/Media/Music"
ALBUM_ART_CACHE="$HOME/.cache/mpd/cover.jpg"

extract_cover_art() {
    ffmpeg -y -i "$1" -an -c:v copy "$2" 2>/dev/null || true
}

while true; do
    CURRENT_SONG="$(mpc current --wait)"
    CURRENT_SONG_PATH="$MUSIC_DIR/$(mpc current -f %file%)"

    extract_cover_art "$CURRENT_SONG_PATH" "$ALBUM_ART_CACHE" &&
    notify-send "Now playing" "$CURRENT_SONG" -i "$ALBUM_ART_CACHE" -h string:x-canonical-private-synchronous:music-notify -t 6000
done
