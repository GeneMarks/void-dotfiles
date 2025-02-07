#!/bin/sh

THEME_DIR="$HOME/.themes"

SELECTED_THEME=$(find -L "$THEME_DIR" -type f -name "*.theme" | sed 's|.*/||' | sed 's/\.theme$//' | \
    "$SCRIPTS/bemenu/run_bemenu.sh" \
    --list 12 \
    --width-factor 0.16 \
    --prompt "themes")

if [ -n "$SELECTED_THEME" ]; then
    "$SCRIPTS/theming/apply_theme.sh" "$THEME_DIR/$SELECTED_THEME.theme"
fi
