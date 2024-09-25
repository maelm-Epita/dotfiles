#!/usr/bin/env bash

# polkit
lxqt-policykit-agent &
# set primary monitor
xrandr --output HMDI-1 --primary
# wireplumber (sound and io)
wireplumber &
# reload pipewire service (weird nixos issue)
systemctl restart --user pipewire
# Wallpaper
swaybg -m fill -i ~/Images/wallpapers/astasis.png &
# bar
waybar &
# notificaitos 
dunst &
# automount drives
udiskie
