#!/bin/sh

bemenu \
    --single-instance \
    --ignorecase \
    --center \
    --list 10 \
    --fixed-height \
    --width-factor 0.26 \
    --line-height 24 \
    --no-spacing \
    --scrollbar autohide \
    --prompt "bemenu" \
    --fn "SystemUI 10" \
    --ff "#000000" \
    --fb "#C0C0C0" \
    --nf "#000000" \
    --nb "#C0C0C0" \
    --af "#000000" \
    --ab "#C0C0C0" \
    --tf "#000000" \
    --tb "#C0C0C0" \
    --hf "#ffffff" \
    --hb "#000080" \
    --cf "#000000" \
    --cb "#000000" \
    --scf "#525252" \
    --scb "#C0C0C0" \
    "$@"
