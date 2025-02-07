#!/bin/bash

source "$SCRIPTS/theming/adjust_hex.sh"

THEME_FILE="$1"
CONFIG_FILE="$HOME/.config/mako/config"

source "$THEME_FILE"

progress_color=$(adjust_hex "$base00" -20)

sed -i "s/^background-color=.*/background-color=$base00/" "$CONFIG_FILE"
sed -i "s/^text-color=.*/text-color=$base03/" "$CONFIG_FILE"
sed -i "s/^border-color=.*/border-color=$base02/" "$CONFIG_FILE"
sed -i "s/^progress-color=.*/progress-color=over $progress_color/" "$CONFIG_FILE"

pkill -x mako
