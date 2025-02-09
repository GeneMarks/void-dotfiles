#!/bin/bash

THEME_FILE="$1"
CONFIG_FILE="$HOME/.config/hypr/hyprlock.conf"

source "$THEME_FILE"

inner_color="rgb(${base00#"#"})"
font_color="rgb(${base03#"#"})"
fail_color="rgb(${base06#"#"})"
inline_foreground="${base03#"#"}"

sed -i -E "s|^([[:space:]]*)inner_color = rgb\([0-9A-Fa-f, ]+\)|\1inner_color = $inner_color|" "$CONFIG_FILE"
sed -i -E "s|^([[:space:]]*)font_color = rgb\([0-9A-Fa-f, ]+\)|\1font_color = $font_color|" "$CONFIG_FILE"
sed -i -E "s|^([[:space:]]*)fail_color = rgb\([0-9A-Fa-f, ]+\)|\1fail_color = $fail_color|" "$CONFIG_FILE"
sed -i -E "s|(foreground=\"##)[0-9A-Fa-f]{6}\"|\1${inline_foreground}\"|" "$CONFIG_FILE"
