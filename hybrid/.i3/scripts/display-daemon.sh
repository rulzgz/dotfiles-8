#!/bin/bash
#
# Credit to gurkensalat
# https://faq.i3wm.org/question/6421/conditional-monitor-cofiguration.1.html
#

onConnection() {
    echo onConnection
    light -O
    xrandr --output HDMI-1 --auto
    xrandr --output LVDS-1 --off
    pacmd set-card-profile 0 "output:hdmi-stereo+input:analog-stereo"
    feh --bg-tile ~/.i3/res/wallpaper.png
}
onDisconnection() {
    echo onDisconnection
    xrandr --output LVDS-1 --auto
    xrandr --output HDMI-1 --off
    pacmd set-card-profile 0 "output:analog-stereo+input:analog-stereo"
    light -I
    feh --bg-tile ~/.i3/res/wallpaper.png
}

#########################

statefile="`mktemp`"

quit() {
    rm "$statefile"
    exit 1
}
trap quit SIGINT SIGTERM

getstate() {
    state="`xrandr -q | wc -l`"
}
savestate() {
    echo "$state" > "$statefile"
}
getstate
savestate

xev -root -event randr | grep --line-buffered XRROutputChangeNotifyEvent | \
while IFS= read -r line; do
    getstate
    old="`cat "$statefile"`"
    if [ "$state" -gt "$old" ]; then
        onConnection
    elif [ "$state" -lt "$old" ]; then
        onDisconnection
    fi
    savestate
done
