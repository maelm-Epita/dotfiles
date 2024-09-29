#!/usr/bin/env bash

WallpaperPath=$(ps aux | grep 'swaybg' | grep -v 'grep' | awk '{print $13}')

wal -i $WallpaperPath --saturate 0.5 
