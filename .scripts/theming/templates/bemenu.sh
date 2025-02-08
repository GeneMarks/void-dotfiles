#!/bin/bash

THEME_FILE="$1"
CONFIG_FILE="$SCRIPTS/bemenu/run_bemenu.sh"

declare -A colors

while IFS="=" read -r key value; do
    if [[ "$key" =~ ^base[0-9A-F]+$ ]]; then
        colors[$key]="$value"
    fi
done < "$THEME_FILE"

declare -A bemenu_colors=(
    ["--ff"]="${colors[base03]}"
    ["--fb"]="${colors[base00]}"
    ["--nf"]="${colors[base03]}"
    ["--nb"]="${colors[base00]}"
    ["--af"]="${colors[base03]}"
    ["--ab"]="${colors[base00]}"
    ["--tf"]="${colors[base03]}"
    ["--tb"]="${colors[base00]}"
    ["--hf"]="${colors[base07]}"
    ["--hb"]="${colors[base06]}"
    ["--cf"]="${colors[base03]}"
    ["--cb"]="${colors[base03]}"
    ["--scf"]="${colors[base02]}"
    ["--scb"]="${colors[base00]}"
)

for option in "${!bemenu_colors[@]}"; do
    sed -i "s|$option \"[#a-fA-F0-9]*\"|$option \"${bemenu_colors[$option]}\"|" "$CONFIG_FILE"
done
