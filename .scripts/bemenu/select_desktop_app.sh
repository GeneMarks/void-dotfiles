#!/bin/sh

j4-dmenu-desktop \
    --no-generic \
    --case-insensitive \
    --dmenu="$SCRIPTS/bemenu/run_bemenu.sh --prompt 'apps'"
