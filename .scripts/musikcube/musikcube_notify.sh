#!/bin/bash

MUSIKCUBE_LOG_FILE="$HOME/.config/musikcube/log.txt"
ALBUM_ART_CACHE_DIR="$HOME/.cache/musikcube"
CACHED_ALBUM_ART="$ALBUM_ART_CACHE_DIR/cover.jpg"

mkdir -p "$ALBUM_ART_CACHE_DIR"

get_track() {
    track=$(tac "$MUSIKCUBE_LOG_FILE" | grep -m1 --text "starting track at" | sed -E 's/.*starting track at //')
}

get_track_info() {
    track_title=$(exiftool "$track" | grep "Title" | awk -F ': ' '{print $2}')
    track_albumartist=$(exiftool "$track" | grep "Albumartist" | awk -F ': ' '{print $2}')
}

extract_album_art() {
    ffmpeg -y -i "$track" -an -c:v copy "$CACHED_ALBUM_ART" &> /dev/null

    # Delete old cache if extraction failed so it isn't in notif
    if [[ $? -ne 0 ]]; then
        rm -f "$CACHED_ALBUM_ART"
    fi
}

get_track
current_track=$track

while true; do
    sleep 1
    get_track

    if [ "$track" == "$current_track" ] || [ "$track" == "" ]; then
        continue
    fi

    current_track="$track"

    get_track_info
    extract_album_art

    notify-send "Now playing" "$track_title\n$track_albumartist" -i "$CACHED_ALBUM_ART" -h string:x-canonical-private-synchronous:music-notify -t 6000
done
