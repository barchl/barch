#!/usr/bin/env fish

# Menu de configurações do Hyprland, adicionar também 
set files (ls ~/.config/hypr/config/)

set choices $files

set script_dir (dirname (status --current-filename))

set choice (printf "%s\n" $choices| 
    rofi -dmenu -theme ~/.config/rofi/green.rasi -p 'Hyprland')

if test -n "$choice" 
  kitty --hold nvim ~/.config/hypr/config/$choice
end
