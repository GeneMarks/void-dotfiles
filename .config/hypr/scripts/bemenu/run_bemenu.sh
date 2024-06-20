#!/bin/bash

bemenu \
    --single-instance \
    --ignorecase \
    --center \
    --list 10 \
    --fixed-height \
    --width-factor 0.26 \
    --line-height 22 \
    --no-spacing \
    --scrollbar autohide \
    --prompt 'bemenu' \
    --fn 'SystemUI 12' \
    --fb '#0f1014' \
    --nf '#c7bcb7' \
    --nb '#0f1014' \
    --ab '#0f1014' \
    --tb '#0f1014' \
    --tf '#ffffff' \
    --hb '#1b1d24' \
    --hf '#c7bcb7' \
    --scb '#0f1014' \
    --scf '#5d6066' \
    $@
