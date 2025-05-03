#!/bin/bash

theme="kMenu"
dir="$HOME/.config/rofi"
rofi_command="rofi -theme $dir/$theme -no-fixed-num-lines"

shutdown="Shutdown"
reboot="Reboot"
logout="Logout"
suspend="Suspend"

confirm_exit() {
	confirm=$(printf "No\nYes" | $rofi_command -dmenu -i -lines 2 -p "Are You Sure?")

	[[ "$confirm" == "Yes" ]]
}

options="$shutdown\n$reboot\n$logout\n$suspend"
uptime=$(uptime -p | sed -e 's/up //g')

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -lines 4 -selected-row 2)"
case $chosen in
    	$shutdown)
		if confirm_exit; then
			systemctl poweroff
		fi
        ;;
    	$reboot)
		if confirm_exit; then
			systemctl reboot
		fi
        ;;
	$logout)
		if confirm_exit; then
			# try gracefully exit apps
			HYPRCMDS=$(hyprctl -j clients | jq -j '.[] | "dispatch closewindow address:\(.address); "')
			hyprctl --batch "$HYPRCMDS" >> /tmp/hypr/hyrpexitwithgrace.log 2>&1
		
			# then logout
			hyprctl dispatch exit
		fi
	;;
    	$suspend)
		if confirm_exit; then
			# mute all
			amixer set Master mute
			systemctl suspend
		fi
        ;;

esac
