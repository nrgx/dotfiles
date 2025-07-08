# set layouts
setxkbmap -layout us,ru -option grp:alt_space_toggle &
sxhkd &

# start window manager
exec dwm

# start status monitor
slstatus &

# start audio
exec pipewire

# set wallpaper
feh --bg-scale ~/pics/wallpaper.png

# start everything
startx

