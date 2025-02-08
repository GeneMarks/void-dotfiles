#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 <theme-file>"
    exit 1
fi

THEME_FILE="$1"
TEMPLATES_DIR="$SCRIPTS/theming/templates"

if [[ ! -f "$THEME_FILE" ]]; then
    echo "Error: Theme file not found: $THEME_FILE"
    exit 1
fi

for script in "$TEMPLATES_DIR"/*.sh; do
    echo "Applying theme with: $script"
    "$script" "$THEME_FILE"
done

echo "Theme $1 applied."
