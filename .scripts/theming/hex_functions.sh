#!/bin/bash

# Adjusts brightness of a hex color by a given percentage (negative = darken, positive = brighten)
adjust_hex_brightness() {
    local hex="$1" # Input hex color
    local amount="$2" # Amount to adjust (-100 to 100)

    hex="${hex#"#"}"

    local r=$((0x${hex:0:2}))
    local g=$((0x${hex:2:2}))
    local b=$((0x${hex:4:2}))

    if (( amount < 0 )); then
        # Darken
        local adjust=$((-amount)) # Convert to positive
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

# Adjusts brightness of a hex color by a given percentage (automatically determines whether to brighten or darken)
adjust_hex_brightness_auto() {
    local hex="$1" # Input hex color
    local amount="$2" # Amount to adjust (0 to 100)

    hex="${hex#"#"}"

    local r=$((0x${hex:0:2}))
    local g=$((0x${hex:2:2}))
    local b=$((0x${hex:4:2}))

    # Calculate brightness (perceived luminance formula)
    local brightness=$(( (r * 299 + g * 587 + b * 114) / 1000 ))

    (( brightness > 128 )) && amount=$((-amount))

    # Apply a stronger minimum increase to very dark colors
    if (( r <= 10 && g <= 10 && b <= 10 )); then
        r=$((r + ((255 - r) * amount / 100) + 10))
        g=$((g + ((255 - g) * amount / 100) + 10))
        b=$((b + ((255 - b) * amount / 100) + 10))
    else
        r=$((r + (r * amount / 100)))
        g=$((g + (g * amount / 100)))
        b=$((b + (b * amount / 100)))
    fi

    ((r < 0)) && r=0
    ((g < 0)) && g=0
    ((b < 0)) && b=0
    ((r > 255)) && r=255
    ((g > 255)) && g=255
    ((b > 255)) && b=255

    printf "#%02x%02x%02x\n" "$r" "$g" "$b"
}
