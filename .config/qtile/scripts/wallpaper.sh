#!/bin/bash
set -o nounset  # exit on uninitialised variable
set -o errexit  # exit on error
#set -o xtrace   # debug mode
setxkbmap -option grp:ralt_rshift_toggle us,ru &

picom --transparent-clipping &
feh --bg-fill ~/Pictures/walls/3.jpg &
