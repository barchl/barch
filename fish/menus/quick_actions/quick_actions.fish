#!/usr/bin/env fish

set clear_nvim_swap       " Clear Neovim swap files"
set web_search            "󰜏 Web Search"
set restart_waybar        " Restart Waybar"
set update_system         "󰚰 Update System"
set clear_command_history " Clear Command History"

set choices $update_system $restart_waybar $web_search $clear_command_history $clear_nvim_swap

set script_dir (dirname (status --current-filename))

function funcclear_nvim_swap
  set answer "$(fish "$script_dir/confirm.fish")"
  if test $answer = "y"
    rm .local/state/nvim/swap/*
  end
end

function funcrestart_waybar
  pkill waybar && waybar  
end

set choice (printf "%s\n" $choices| 
    rofi -dmenu -theme ~/.config/rofi/green.rasi -p '󱐋 Quick Actions')

switch "$choice"
  case $update_system
    kitty --hold sudo pacman -Syu
  case $clear_nvim_swap
    funcclear_nvim_swap
  case $web_search
    fish "$script_dir/web_search.fish"
  case $clear_command_history
    kitty --hold "history clear"
  case $restart_waybar
    funcrestart_waybar
end   
