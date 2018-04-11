#!/bin/bash

#### res=$(rofi -dmenu -i -padding $(($(xwininfo -root |awk '/Height/ { print $2}')/3)) < ~/.i3/scripts/rofi-exit)
res=$(rofi -dmenu -i -lines 3 -width -9 -hide-scrollbar < ~/.i3/scripts/rofi-exit)

#if [ $res = "lock" ]; then
#    light -O && ~/.i3/scripts/i3lock.sh
#fi
if [ $res = "suspend" ]; then
    light -O && systemctl suspend
fi
#if [ $res = "logout" ]; then
#    light -O && i3-msg exit
#fi
if [ $res = "restart" ]; then
    light -O && systemctl reboot
fi
if [ $res = "shutdown" ]; then
    light -O && systemctl poweroff
fi
exit 0
