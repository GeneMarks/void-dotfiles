#!/bin/bash

CURRENT_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme)

if [[ "$CURRENT_THEME" == "'Adwaita-dark'" ]]; then
    gsettings set org.gnome.desktop.interface gtk-theme Adwaita
    gsettings set org.gnome.desktop.interface color-scheme prefer-light
else
    gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
fi
