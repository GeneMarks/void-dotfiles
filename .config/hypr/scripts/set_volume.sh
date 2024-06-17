#!/bin/bash

case $1 in
    up)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
        wpctl set-volume --limit 1 @DEFAULT_AUDIO_SINK@ 5%+
        ;;
    down)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        ;;
    mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
esac

VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
MUTE=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')

if [ "$MUTE" = "[MUTED]" ]; then
    MESSAGE="Muted"
else
    MESSAGE="Volume: ${VOLUME}%"
fi

notify-send "Volume Control" "$MESSAGE" -h int:value:$VOLUME -h string:x-canonical-private-synchronous:sys-notify -t 3000

