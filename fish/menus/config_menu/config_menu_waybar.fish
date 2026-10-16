#!/usr/bin/env fish

# Menu de configurações do Waybar, A barra-que-mostra-as-horas 
set title "Waybar"

set files (ls ~/.config/waybar/)

set choices $files

set script_dir (dirname (status --current-filename))

set choice (printf "%s\n" $choices| 
    rofi -dmenu -theme ~/.config/rofi/green.rasi -p '')

if test -n "$choice" 
  kitty --hold nvim ~/.config/waybar/$choice
end
