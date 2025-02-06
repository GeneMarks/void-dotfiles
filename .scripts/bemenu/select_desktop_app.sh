#!/bin/sh

export XDG_DATA_DIRS="$HOME/.local/share/applications"

j4-dmenu-desktop \
    --no-generic \
    --dmenu="$SCRIPTS/bemenu/run_bemenu.sh --prompt 'apps'"
