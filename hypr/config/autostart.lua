

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
  hl.exec_cmd("waybar")
  hl.exec_cmd("systemctl --user enable --now opentabletdriver.service")
  hl.exec_cmd("kitty --hold 'btop' ")
  hl.exec_cmd("~/.local/bin/waypaper --restore")
  hl.exec_cmd("hyprpolkitagent & swaync & blueman-applet")
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
end)


