#!/bin/bash

CACHE_DIR=$HOME/.cache/lf
mkdir -p "$CACHE_DIR"

run_chafa() {
    chafa --polite on --fill=block --size "$2"x"$3" "$1"
}

generate_video_frame() {
    DURATION=$(ffprobe -i "$1" -show_entries format=duration -v quiet -of csv="p=0")
    FRAME_TIME=$(echo "$DURATION * 0.05" | bc)
    ffmpeg -y -ss "$FRAME_TIME" -i "$1" -vframes 1 "$2"
}

save_cover_art() {
    ffmpeg -y -i "$1" -an -c:v copy "$2"
}

case "$1" in
    *.png|*.jpg|*.jpeg|*.gif|*.bmp|*.tiff)
        run_chafa "$1" "$2" "$3"
        ;;

    *.mkv|*.mp4|*.avi|*.mov)
        VIDEO_THUMB_CACHE=$CACHE_DIR/video_thumb.jpg
        generate_video_frame "$1" "$VIDEO_THUMB_CACHE"
        run_chafa "$VIDEO_THUMB_CACHE" "$2" "$3"
        ;;

    *.mp3|*.flac|*.m4a)
        ALBUM_ART_CACHE=$CACHE_DIR/album_art.jpg
        save_cover_art "$1" "$ALBUM_ART_CACHE"
        run_chafa "$ALBUM_ART_CACHE" "$(echo "$2 / 2" | bc)" "$(echo "$3 / 2" | bc)"
        ;;

    *)
        head -n 500 "$1"
        ;;
esac
