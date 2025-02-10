#!/bin/bash

source "$SCRIPTS/theming/hex_functions.sh"

THEME_FILE="$1"
CONFIG_FILE="$HOME/.config/musikcube/themes/theme.json"

declare -A colors
while IFS="=" read -r key value; do
    if [[ "$key" =~ ^base[0-9A-F]+$ ]]; then
        colors[$key]="$value"
    fi
done < "$THEME_FILE"

button_background_normal=$(adjust_hex_brightness_auto "${colors[base06]}" 20)

declare -A musikcube_colors=(
    ["background"]="${colors[base00]}"
    ["foreground"]="${colors[base03]}"
    ["focused_border"]="${colors[base06]}"
    ["text_focused"]="${colors[base06]}"
    ["text_active"]="${colors[base06]}"
    ["text_disabled"]="${colors[base03]}"
    ["text_hidden"]="${colors[base03]}"
    ["text_warning"]="${colors[base03]}"
    ["text_error"]="${colors[base03]}"
    ["overlay_background"]="${colors[base02]}"
    ["overlay_foreground"]="${colors[base05]}"
    ["overlay_border"]="${colors[base05]}"
    ["overlay_focused_border"]="${colors[base05]}"
    ["shortcuts_background"]="${colors[base06]}"
    ["shortcuts_foreground"]="${colors[base07]}"
    ["shortcuts_background_focused"]="${colors[base06]}"
    ["shortcuts_foreground_focused"]="${colors[base07]}"
    ["button_background_normal"]="$button_background_normal"
    ["button_foreground_normal"]="${colors[base07]}"
    ["button_background_active"]="${colors[base07]}"
    ["button_foreground_active"]="${colors[base06]}"
    ["banner_background"]="${colors[base02]}"
    ["banner_foreground"]="${colors[base05]}"
    ["list_header_background"]="${colors[base00]}"
    ["list_header_foreground"]="${colors[base03]}"
    ["list_header_highlighted_background"]="${colors[base06]}"
    ["list_header_highlighted_foreground"]="${colors[base07]}"
    ["list_item_highlighted_background"]="${colors[base06]}"
    ["list_item_highlighted_foreground"]="${colors[base07]}"
    ["list_item_active_background"]="${colors[base02]}"
    ["list_item_active_foreground"]="${colors[base05]}"
    ["list_item_active_highlighted_background"]="${colors[base06]}"
    ["list_item_active_highlighted_foreground"]="${colors[base07]}"
)

for property in "${!musikcube_colors[@]}"; do
    sed -i "s|\"$property\":{[^}]*\"hex\":\"#[A-Fa-f0-9]*\"|\"$property\":{\"hex\":\"${musikcube_colors[$property]}\"|" "$CONFIG_FILE"
done
