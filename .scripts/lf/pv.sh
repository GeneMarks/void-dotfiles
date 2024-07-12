#!/bin/bash

CACHE_DIR=$HOME/.cache/lf
mkdir -p "$CACHE_DIR"

print_image() {
    chafa --polite on --fill=block --size "$2"x"$3" "$1"
}

generate_video_frame() {
    DURATION=$(ffprobe -i "$1" -show_entries format=duration -v quiet -of csv="p=0")
    FRAME_TIME=$(echo "$DURATION * 0.05" | bc)
    ffmpeg -y -ss "$FRAME_TIME" -i "$1" -vframes 1 "$2" || rm -f "$2"
}

extract_gif_frame() {
    magick "$1[0]" $2 || rm -f "$2"
}

extract_cover_art() {
    ffmpeg -y -i "$1" -an -c:v copy "$2" &> /dev/null || rm -f "$2"
}

case "$1" in
    *.png|*.jpg|*.jpeg|*.bmp|*.tiff|*.webp)
        print_image "$1" "$2" "$3"
        ;;

    *.gif)
        GIF_FRAME_CACHE=$CACHE_DIR/gif_frame.jpg
        extract_gif_frame "$1" "$GIF_FRAME_CACHE"
        print_image "$GIF_FRAME_CACHE" "$2" "$3"
        ;;

    *.mkv|*.mp4|*.avi|*.mov)
        VIDEO_THUMB_CACHE=$CACHE_DIR/video_thumb.jpg
        generate_video_frame "$1" "$VIDEO_THUMB_CACHE"
        print_image "$VIDEO_THUMB_CACHE" "$2" "$3"
        ;;

    *.mp3|*.flac|*.m4a)
        ALBUM_ART_CACHE=$CACHE_DIR/album_art.jpg
        extract_cover_art "$1" "$ALBUM_ART_CACHE"
        print_image "$ALBUM_ART_CACHE" "$(echo "$2 / 2" | bc)" "$(echo "$3 / 2" | bc)"
        ;;

    *)
        head -n 500 "$1"
        ;;
esac
