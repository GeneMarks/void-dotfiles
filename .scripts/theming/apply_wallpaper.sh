#!/bin/bash

##### Functions ######
generate_video_frame() {
    local input_file="$1"
    local output_file="$2"

    DURATION=$(ffprobe -i "$input_file" -show_entries format=duration -v quiet -of csv="p=0")
    FRAME_TIME=$(echo "scale=3; $DURATION * 0.05" | bc | sed 's/^\./0./')

    ffmpeg -y -ss "$FRAME_TIME" -i "$input_file" -vframes 1 -update 1 "$output_file" || rm -f "$output_file"
}

extract_gif_frame() {
    local input_file="$1"
    local output_file="$2"

    magick "$input_file[0]" "$output_file" || rm -f "$output_file"
}


##### Main ######
WALLPAPERS_DIR="$HOME/wallpapers"
CACHED_WALLPAPER="$HOME/.cache/current_wallpaper"
CACHED_WALLPAPER_NAME="$HOME/.cache/current_wallpaper_name"
CACHED_PREVIEWS_DIR="$HOME/.cache/wallpaper_previews"

if [[ -n "$1" ]]; then
    CHOSEN_WALLPAPER="$1"
else
    CHOSEN_WALLPAPER="$(cat "$CACHED_WALLPAPER_NAME")"
    echo $CHOSEN_WALLPAPER
fi

echo "$CHOSEN_WALLPAPER" > "$CACHED_WALLPAPER_NAME"

mkdir -p "$CACHED_PREVIEWS_DIR"

CHOSEN_WALLPAPER="$WALLPAPERS_DIR/$CHOSEN_WALLPAPER"

# Get file extension and convert to lowercase
EXT="${CHOSEN_WALLPAPER##*.}"
EXT="${EXT,,}"

pkill swaybg
pkill mpvpaper

# Use swabg for static images and mpvpaper for animated
if [[ "$EXT" == "jpg" || "$EXT" == "jpeg" || "$EXT" == "png" ]]; then
    ln -sf "$CHOSEN_WALLPAPER" "$CACHED_WALLPAPER"
    swaybg --mode fill -i "$CACHED_WALLPAPER" &
elif [[ "$EXT" == "gif" || "$EXT" == "mp4" || "$EXT" == "webm" || "$EXT" == "mkv" ]]; then
    PREVIEW_IMAGE="$CACHED_PREVIEWS_DIR/$(basename "$CHOSEN_WALLPAPER").png"
    rm -f "$PREVIEW_IMAGE"

    if [[ "$EXT" == "gif" ]]; then
        extract_gif_frame "$CHOSEN_WALLPAPER" "$PREVIEW_IMAGE"
    else
        generate_video_frame "$CHOSEN_WALLPAPER" "$PREVIEW_IMAGE"
    fi

    ln -sf "$PREVIEW_IMAGE" "$CACHED_WALLPAPER"
    mpvpaper "*" -s -o "--loop --no-audio --fullscreen --video-unscaled=no --panscan=1.0" "$CHOSEN_WALLPAPER" &
else
    echo "Unsupported file type: $EXT"
fi
