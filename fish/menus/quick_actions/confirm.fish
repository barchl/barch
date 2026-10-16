#!/usr/bin/env fish

set yes " Yes"
set no " No"

set choices $yes $no

set script_dir (dirname (status --current-filename))

set choice (printf "%s\n" $choices| 
    rofi -dmenu -theme ~/.config/rofi/green.rasi -p '? You sure?')

switch "$choice"
  case $yes
    echo "y"
  case $no
    echo "n"
end
