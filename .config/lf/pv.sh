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

case "$1" in
    *.png|*.jpg|*.jpeg|*.gif|*.bmp|*.tiff)
        run_chafa "$1" "$2" "$3"
        ;;

    *.mkv|*.mp4|*.avi|*.mov)
        VIDEO_THUMB=$CACHE_DIR/video_thumb.jpg
        generate_video_frame "$1" "$VIDEO_THUMB"
        run_chafa "$VIDEO_THUMB" "$2" "$3"
        ;;

    *)
        head -n 500 "$1"
        ;;
esac
