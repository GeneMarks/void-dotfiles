#!/bin/bash

THEME_FILE="$1"
CONFIG_FILE="$HOME/.config/hypr/conf/appearance.conf"

source "$THEME_FILE"

active_border="rgb(${base02#"#"})"
inactive_border="rgb(${base02#"#"})"

sed -i -E "s|^([[:space:]]*)col.active_border = rgb\([0-9A-Fa-f, ]+\)|\1col.active_border = $active_border|" "$CONFIG_FILE"
sed -i -E "s|^([[:space:]]*)col.inactive_border = rgb\([0-9A-Fa-f, ]+\)|\1col.inactive_border = $inactive_border|" "$CONFIG_FILE"
