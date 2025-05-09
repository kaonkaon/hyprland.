#!/bin/bash

until hyprctl activewindow -j &>/dev/null; do
	sleep 0.5
done

while true; do
	clients=$(hyprctl activewindow -j | jq -r '.class // empty')

    	if [[ -n "$clients" ]]; then
        	# Window(s) open — use horizontal bar
		if eww active-windows | grep sysinfo; then
			eww close sysinfo
		fi
        	if ! pgrep -x waybar > /dev/null; then
            		waybar -c ~/.config/waybar/config_horizontal -s ~/.config/waybar/stylehor.css &
        	fi
    	else
        	# No windows open — eww
		pkill -x waybar  # Kill horizontal Waybar
        	if ! eww active-windows | grep sysinfo; then
        		eww open sysinfo
		fi
    	fi

    	sleep 1
done
