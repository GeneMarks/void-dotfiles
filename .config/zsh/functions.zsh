### Functions ###

# Deletes specified system .desktop files after xbps-install
xbps-install() {
    sudo xbps-install "$@"

    if [ $? -eq 0 ]; then
        sudo "$SCRIPTS/void/delete_desktop_entries.sh"
    fi
}
