#!/bin/bash

if xrandr -q | grep -q 'HDMI-1 connected' ; then
    xrandr --output HDMI-1 --auto
    xrandr --output LVDS-1 --off
    pacmd set-card-profile 0 "output:hdmi-stereo+input:analog-stereo"
else
    xrandr --output LVDS-1 --auto
    xrandr --output HDMI-1 --off
    pacmd set-card-profile 0 "output:analog-stereo+input:analog-stereo"
    light -I
fi

feh --bg-tile ~/.i3/res/wallpaper.png
sh ~/.i3/scripts/polybar.sh

exit
