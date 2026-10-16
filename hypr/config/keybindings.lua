-- Teclas de atalho, vc pode ver os programas em programs.lua

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + W", hl.dsp.window.close())

-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd(logout_menu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + CTRL + SPACE", hl.dsp.exec_cmd(waypaper))
hl.bind(mainMod .. " + CTRL + ALT + SPACE", hl.dsp.exec_cmd(waypaper_random))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(game_engine))

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + ALT + SPACE", hl.dsp.exec_cmd(apps_menu))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(rmenu))

hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(notes))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + BACKSPACE", hl.dsp.exec_cmd(second_browser))
hl.bind(mainMod .. " + BACKSPACE", hl.dsp.exec_cmd(mensager))

hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd(code_editor))
hl.bind(mainMod .. " + ALT + N", hl.dsp.exec_cmd(second_code_editor))

hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(web_search))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd(config_menu))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(quick_actions))

hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(notifications))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(lockscreen))

-- aqui eu fiz pra mover as janelas, bem legalzinho, mais pra cima eu adicionei algumas binds
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({direction = "left"}))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({direction = "right"}))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({direction = "up"}))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({direction = "down"}))

hl.bind(mainMod .. " + K", hl.dsp.window.resize({ x = 1200, y = 800}))

-- Redimensionar janelas
local window = hl.dsp.window
local left  = { x = -25, y = 0, relative = true }
local right = { x = 25,  y = 0, relative = true }
local up    = { x = 0, y = -25, relative = true }
local down  = { x = 0, y = 25, relative = true }
local options = {
    repeating = true
}
hl.bind(mainMod .. " + minus", window.resize(left), options)
hl.bind(mainMod .. " + equal", window.resize(right), options)
hl.bind(mainMod .. " + SHIFT + minus", window.resize(up), options)
hl.bind(mainMod .. " + SHIFT + equal", window.resize(down), options)

-- O hyprshot
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd(print_region))
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd(print_window))
hl.bind("PRINT", hl.dsp.exec_cmd(print))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- alt tab
hl.bind("ALT + TAB", function ()
  hl.dispatch(hl.dsp.window.cycle_next())
  hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind(mainMod .. " + TAB", hl.dsp.focus({workspace = "e+1"}), {locked = true, repeating = true})
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.focus({workspace = "e-1"}), {locked = true, repeating = true})

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + CTRL + SHIFT + S", hl.dsp.window.move({ workspace = "1" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

