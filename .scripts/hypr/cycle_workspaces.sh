#!/bin/bash

MAX_WORKSPACES=6

ACTIVE_WORKSPACE=$(hyprctl activeworkspace | grep "workspace ID" | awk '{print $3}')

case "$1" in
    next)
        if [ "$ACTIVE_WORKSPACE" -ne "$MAX_WORKSPACES" ]; then
            TARGET_WORKSPACE=$((ACTIVE_WORKSPACE + 1))
        else
            TARGET_WORKSPACE=1
        fi
        ;;
    prev)
        if [ "$ACTIVE_WORKSPACE" -ne 1 ]; then
            TARGET_WORKSPACE=$((ACTIVE_WORKSPACE - 1))
        else
            TARGET_WORKSPACE=$MAX_WORKSPACES
        fi
        ;;
esac

hyprctl dispatch workspace "$TARGET_WORKSPACE"
