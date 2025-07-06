#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/i3/rofi/"
theme='nord-powermenu-style'

# CMDs
lastlogin="`last $USER | head -n1 | tr -s ' ' | cut -d' ' -f5,6,7`"
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
hibernate=''
shutdown=''
reboot=''
lock=''
suspend=''
logout=''
yes=''
no=''


# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p " $USER@$host" \
		-mesg " UPTIME: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {orientation: vertical; children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$hibernate\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			sudo poweroff
		elif [[ $1 == '--reboot' ]]; then
			sudo reboot
		elif [[ $1 == '--hibernate' ]]; then
			sudo ZZZ 
		elif [[ $1 == '--suspend' ]]; then
			sudo zzz
		elif [[ $1 == '--logout' ]]; then
			i3-msg exit
		elif [[ $1 == '--lock' ]]; then
			i3lock
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)	run_cmd --shutdown ;;
    $reboot)	run_cmd --reboot ;;
    $hibernate)	run_cmd --hibernate ;;
    $suspend)	run_cmd --suspend ;;
    $logout)	run_cmd --logout ;;
    $lock)	run_cmd --lock ;;
esac

