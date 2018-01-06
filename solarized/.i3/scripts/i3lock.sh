#!/bin/sh

A='#002b36'    # background
B='#002b36ff'  # blank
C='#eee8d5ff'  # clear ish
D='#859900ff'  # default
R='#d33682ff'  # ring
T='#859900ff'  # text
W='#dc322fff'  # wrong
V='#268bd2ff'  # verifying

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
