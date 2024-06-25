#!/bin/bash

transmission-remote -a "$@" && notify-send "Transmission" "Torrent added." -t 3000
