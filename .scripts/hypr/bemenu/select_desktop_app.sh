#!/bin/sh

export XDG_DATA_DIRS="$HOME/.local/share/applications"

j4-dmenu-desktop --no-generic --dmenu="$MY_HYPR_SCRIPTS/bemenu/run_bemenu.sh"
