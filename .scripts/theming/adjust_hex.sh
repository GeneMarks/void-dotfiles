#!/bin/sh

# Adjusts a hex color by a given percentage (negative = darken, positive = brighten)
adjust_hex() {
    local hex="$1"  # Input hex color
    local amount="$2"  # Amount to adjust (-100 to 100)

    hex="${hex#"#"}"

    local r=$((0x${hex:0:2}))
    local g=$((0x${hex:2:2}))
    local b=$((0x${hex:4:2}))

    if [ "$amount" -lt 0 ]; then
        # Darken
        local adjust=$(( -1 * amount )) # Convert to positive
        r=$((r - (r * adjust / 100)))
        g=$((g - (g * adjust / 100)))
        b=$((b - (b * adjust / 100)))
    else
        # Brighten
        r=$((r + ((255 - r) * amount / 100)))
        g=$((g + ((255 - g) * amount / 100)))
        b=$((b + ((255 - b) * amount / 100)))
    fi

    ((r < 0)) && r=0
    ((g < 0)) && g=0
    ((b < 0)) && b=0
    ((r > 255)) && r=255
    ((g > 255)) && g=255
    ((b > 255)) && b=255

    printf "#%02x%02x%02x\n" "$r" "$g" "$b"
}
