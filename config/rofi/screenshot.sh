#!/bin/bash

theme="kMenu"
dir="$HOME/.config/rofi"
rofi_command="rofi -theme $dir/$theme -no-fixed-num-lines"

whole="Whole Screen -> Save"
select="Select Area -> Save"
whole_cp="Whole Screen -> Clipboard"
select_cp="Select Area -> Clipboard"

options="$whole\n$select\n$whole_cp\n$select_cp"
uptime=$(uptime -p | sed -e 's/up //g')

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -lines 3 -selected-row 3)"
case $chosen in
    	$whole)
        	eses --whole
	;;
    	$select)
        	eses --select
	;;
    	$whole_cp)
        	eses --whole_cp
	;;
    	$select_cp)
        	eses --select_cp
	;;
esac
