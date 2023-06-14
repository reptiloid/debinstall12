# Keymap
#setxkbmap -option grp:ralt_rshift_toggle us,ru &

# Wallpaper
# nitrogen --restore &
#feh --bg-fill Pictures/walls/3.jpg

# VM Screen Config
xrandr --output Virtual1 --mode 1440x900 &

xrdb merge ~/.Xresources &

# picom --transparent-clipping &

# Start WM 
exec qtile start
