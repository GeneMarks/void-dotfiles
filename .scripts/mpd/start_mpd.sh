#!/bin/bash

# Start mpd server
mpd

# Wait until server is running
while true; do
    status=$(mpc status 2>&1)
    if [[ "$status" != "MPD error"* ]]; then
        break
    fi
    sleep 5
done

# Start mpdris
mpDris2 &
