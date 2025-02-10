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
    ["--ff"]="${colors[base04]}"
    ["--fb"]="${colors[base01]}"
    ["--nf"]="${colors[base03]}"
    ["--nb"]="${colors[base00]}"
    ["--af"]="${colors[base04]}"
    ["--ab"]="${colors[base01]}"
    ["--tf"]="${colors[base04]}"
    ["--tb"]="${colors[base01]}"
    ["--hf"]="${colors[base07]}"
    ["--hb"]="${colors[base06]}"
    ["--cf"]="${colors[base03]}"
    ["--cb"]="${colors[base03]}"
    ["--scf"]="${colors[base02]}"
    ["--scb"]="${colors[base00]}"
)

for property in "${!bemenu_colors[@]}"; do
    sed -i "s|$property \"[#a-fA-F0-9]*\"|$property \"${bemenu_colors[$property]}\"|" "$CONFIG_FILE"
done
