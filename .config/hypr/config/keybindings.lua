---------------------
---- KEYBINDINGS ----
---------------------

local terminal = "kitty"
local fileManager = "dolphin"
local menu = "rofi -show drun -theme $HOME/rofi-collection/theme.rasi"
local browser = "firefox"
local browser_alt = "zen"

-- Sets "SUPER" key as main modifier
local mainMod = "SUPER"
-- Sets "SUPER, SHIFT, ALT, CTRL" keys to "hyper"
local hyper = "SUPER + SHIFT + ALT + CONTROL"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
-- Core Applications
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("vicinae toggle"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(browser_alt))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu)) --("~/.config/hypr/scripts/toggle-rofi.sh"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("~/.config/waybar/scripts/launch.sh"))

-- Close Window
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)

-- Shutdown Hyprland
hl.bind(
  mainMod .. " + F12",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

-- Window management
hl.bind(mainMod .. " + I", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + M", hl.dsp.layout("swapsplit")) -- dwindle only
hl.bind(mainMod .. " + N", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move focus with mainMod + vim keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod  + SHIFT + vim keys
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.focus({ workspace = "e-1" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMicMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- "HYPER" keybinds
hl.bind(hyper .. " + C", hl.dsp.exec_cmd("code"))
hl.bind(hyper .. " + D", hl.dsp.exec_cmd("~/.local/bin/pkg-scripts/script-selector-rofi"))
hl.bind(hyper .. " + E", hl.dsp.exec_cmd("rofi -modi emoji -show emoji -theme $HOME/rofi-collection/theme.rasi"))
hl.bind(hyper .. " + G", hl.dsp.exec_cmd("gpu-screen-recorder-gtk"))
hl.bind(hyper .. " + L", hl.dsp.exec_cmd("lutris"))
hl.bind(hyper .. " + N", hl.dsp.exec_cmd("kitty -e nvim"))
hl.bind(hyper .. " + S", hl.dsp.exec_cmd("subl"))
hl.bind(hyper .. " + T", hl.dsp.exec_cmd("Telegram"))
hl.bind(hyper .. " + V", hl.dsp.exec_cmd("vesktop"))
hl.bind(hyper .. " + W", hl.dsp.exec_cmd("whatsdesk"))
hl.bind(hyper .. " + Z", hl.dsp.exec_cmd("zeditor"))

-- Vicinae Deeplink keybinds
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("vicinae 'vicinae://launch/wm/switch-windows'"))
hl.bind(mainMod .. " + Slash", hl.dsp.exec_cmd("vicinae 'vicinae://launch/@brpaz/store.vicinae.brotab/tabs-list'"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("vicinae 'vicinae://launch/clipboard/history'"))
