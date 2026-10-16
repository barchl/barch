#!/usr/bin/env fish

set choice (rofi -dmenu -theme ~/.config/rofi/command_line_green.rasi -p '>_')

if test -n "$choice"
  eval $choice
end
