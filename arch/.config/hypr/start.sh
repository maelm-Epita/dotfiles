#!/usr/bin/env bash

# polkit authentification
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# Wallpaper
swaybg -i ~/Images/wallpapers/yumenikkipurp-var.png &
# bar
waybar &
# dunst 
dunst 
