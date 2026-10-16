#!/usr/bin/env fish

set script_dir (dirname (status --current-filename))

set choice (rofi -dmenu -theme ~/.config/rofi/command_line_green.rasi -p '󰜏 Web Search')

if test "$choice"
  eval librewolf --new-window -search "$(printf '"%s"\n' "$choice" )"
end
