#!/usr/bin/env bash

# polkit
lxqt-policykit-agent &
# set primary monitor
xrandr --output HMDI-1 --primary
# pipewire and wireplumber (sound and io)
pipewire &
pipewire-pulse &
wireplumber &
# Wallpaper
swaybg -m fill -i ~/Images/wallpapers/astasis.png &
# bar
waybar &
# notificaitos 
dunst &
# automount drives
udiskie
