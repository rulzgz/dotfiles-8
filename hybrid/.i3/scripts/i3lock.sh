#!/bin/sh

A='#282828'    # background
B='#282828ff'  # blank
C='#ebdbb2ff'  # clear ish
D='#d79921ff'  # default
R='#458588ff'  # ring
T='#d79921ff'  # text
W='#cc241dff'  # wrong
V='#98971aff'  # verifying

i3lock \
--insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--textcolor=$T        \
--timecolor=$D        \
--datecolor=$D        \
--layoutcolor=$T      \
--keyhlcolor=$R       \
--bshlcolor=$W        \
\
--screen 0            \
--color=$A            \
--clock               \
--indicator           \
--timestr="%I:%M %p"  \
--datestr="%m/%d/%Y"  \
