#!/sbin/bash


theme="kMenu"
dir="$HOME/.config/rofi"

rofi_command="rofi -theme $dir/$theme"

shutdown="Shutdown"
reboot="Reboot"
suspend="Suspend"

confirm_exit() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		-p "Are You Sure? : "\
		-theme $dir/$theme
}

msg() {
	rofi -theme "$dir/$theme" -e "Available Options  -  yes / y / no / n"
}

options="$shutdown\n$reboot\n$suspend"

uptime=$(uptime -p | sed -e 's/up //g')

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
			systemctl poweroff
        ;;
    $reboot)
			systemctl reboot
        ;;
    $suspend)
			mpc -q pause
			amixer set Master mute
			systemctl suspend
        ;;
esac
