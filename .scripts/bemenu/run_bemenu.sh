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
    --prompt 'bemenu' \
    --fn 'SystemUI 10' \
    --ff '#c7bcb7' \
    --fb '#0f0f0f' \
    --nf '#c7bcb7' \
    --nb '#0f0f0f' \
    --af '#c7bcb7' \
    --ab '#0f0f0f' \
    --tf '#c7bcb7' \
    --tb '#0f0f0f' \
    --hf '#c7bcb7' \
    --hb '#1c1c1c' \
    --scf '#3d3d3d' \
    --scb '#0f0f0f' \
    "$@"
