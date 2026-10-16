#!/usr/bin/env fish

set hyprland " Hyprland"
set waybar   "Waybar"

set choices $hyprland $waybar

set script_dir (dirname (status --current-filename))
echo $script_dir

set choice (printf "%s\n" $choices| 
    rofi -dmenu -theme ~/.config/rofi/green.rasi -p 'Config')

switch "$choice"
  case $hyprland
    fish "$script_dir/config_menu_hyprland.fish"
  case $waybar
    fish "$script_dir/config_menu_waybar.fish"
end
