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
    --ff "#cfcfcf" \
    --fb "#590556" \
    --nf "#cfcfcf" \
    --nb "#5e065b" \
    --af "#cfcfcf" \
    --ab "#590556" \
    --tf "#cfcfcf" \
    --tb "#590556" \
    --hf "#000000" \
    --hb "#b347a4" \
    --cf "#cfcfcf" \
    --cb "#cfcfcf" \
    --scf "#de6000" \
    --scb "#5e065b" \
    "$@"
