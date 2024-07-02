#!/bin/sh


LOCKFILE="/tmp/brightness_control.lock"

if [ -e "$LOCKFILE" ]; then
    exit 1
fi

touch "$LOCKFILE"
trap 'rm -f "$LOCKFILE"' EXIT


BRIGHTNESS=$(ddcutil getvcp 10 --terse | cut -d ' ' -f 4)

case "$1" in
    up)
        if [ "$BRIGHTNESS" -lt 100 ]; then
            ddcutil setvcp 10 + 5
            BRIGHTNESS=$((BRIGHTNESS + 5))
        fi
        ;;
    down)
        if [ "$BRIGHTNESS" -gt 0 ]; then
            ddcutil setvcp 10 - 5
            BRIGHTNESS=$((BRIGHTNESS - 5))
        fi
        ;;
esac

notify-send "Brightness Control" "Brightness: ${BRIGHTNESS}%" -h int:value:"$BRIGHTNESS" -h string:x-canonical-private-synchronous:sys-notify -t 3000
