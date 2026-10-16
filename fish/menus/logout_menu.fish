#!/usr/bin/env fish

set lockscreen " Lockscreen"
set shutdown   "⭘ Shutdown"
set reboot     "󰜉 Reboot"
set logout     " Logout"

set choices $lockscreen $shutdown $reboot $logout

set script_dir (dirname (status --current-filename))

set choice (printf "%s\n" $choices| 
    rofi -dmenu -theme ~/.config/rofi/green.rasi -p 'Menu')

switch "$choice"
    case $lockscreen
        hyprlock
    case $shutdown
        shutdown now
    case $reboot
        shutdown -r now
    case $logout 
        command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'
end
