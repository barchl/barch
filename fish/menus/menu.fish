#!/usr/bin/env fish


set programs      "󰀻 Programs"
set config        " Config"
set mine          "󰍳 Minecraft"
set quick_actions "󱐋 Quick Actions"
set command       " Commmand Line"
set system        "⏻ System"

set choices $programs $config $mine $quick_actions $command $system

set script_dir (dirname (status --current-filename))

set choice (printf "%s\n" $choices | 
    rofi -dmenu -theme ~/.config/rofi/green.rasi -p 'Menu')

switch "$choice"
  case $programs
    rofi -show drun -theme ~/.config/rofi/green.rasi 
  case $config
    fish "$script_dir/config_menu/config_menu.fish"
  case $mine
    prismlauncher
  case $quick_actions
    fish "$script_dir/quick_actions/quick_actions.fish"
  case $command
    fish "$script_dir/command_line.fish"
  case $system
    fish "$script_dir/logout_menu.fish" 
end
