# --- keyboard & monitor ---
setxkbmap -layout us,ru -option grp:super_space_toggle &
xrandr --output DP-4 --mode 1920x1080 --rate 239.96 &

# --- services / daemons ---
pipewire &        # audio
sxhkd &           # hotkeys
slstatus &        # status bar
feh --bg-scale $HOME/pics/wallpaper.png &  # wallpaper

# --- lock screen ---
xautolock \
	-detectsleep \
	-time 30 \
	-notify 30 \
	-notifier 'xsetroot -name "Locking screen in 30s"' \
	-locker "slock" \
	& 

# --- finally launch the WM ---
exec dwm
