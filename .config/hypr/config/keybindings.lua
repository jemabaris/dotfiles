---------------------
---- KEYBINDINGS ----
---------------------

local terminal = "kitty"
local terminal_alt = "ghostty"
local fileManager = "dolphin"
local browser = "firefox"
local browser_alt = "zen-browser"

-- Sets "SUPER" key as main modifier
local mainMod = "SUPER"
-- Sets "SUPER, SHIFT, ALT, CTRL" keys to "hyper"
local hyper = "SUPER + SHIFT + ALT + CONTROL"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
-- Core Applications
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(terminal_alt))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("vicinae toggle"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(browser_alt))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("pkill waybar; waybar &")) -- Reload waybar
hl.bind(mainMod .. " + CTRL + V", hl.dsp.exec_cmd("cursor-clip"))
hl.bind(mainMod .. " + ALT + V", hl.dsp.exec_cmd("kitty --class clipse -e 'clipse'"))

-- Hyprshot and Hyprpicker
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -an"))
hl.bind("CONTROL + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m output"))

-- Toggle Rofi
hl.bind(mainMod .. " + D", function()
  local handle = io.popen("pgrep -x rofi")
  if handle then
    local result = handle:read("*a")
    handle:close()
    if result ~= "" then
      os.execute("pkill -x rofi")
      return
    end
  end
  hl.exec_cmd("rofi -show drun -theme ~/rofi-collection/theme.rasi")
end)

-- Quake-style terminal
hl.bind(
  mainMod .. " + BACKSPACE",
  hl.dsp.exec_cmd("kitten quick-access-terminal --config ~/.config/kitty/quick-access-terminal.conf")
)

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
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + ALT + P", hl.dsp.window.pseudo())

-- Toggle window float and pin it in one lambda function
hl.bind("SUPER + P", function()
  hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
  hl.dispatch(hl.dsp.window.pin())
end)

-- Resize windows with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + up", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
hl.bind(mainMod .. " + down", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })

-- Move focus with mainMod + vim keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod  + SHIFT + vim keys
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.focus({ workspace = "-1" }))

-- Scroll through existing workspaces with SUPER + SHIFT + scroll
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + mouse_up", hl.dsp.focus({ workspace = "-1" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with SUPER + SHIFT + [0-9]
-- Move active window to a workspace silently with SUPER + ALT + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
  hl.bind(mainMod .. " + ALT + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Move active window silently to next/previous workspace with SUPER + CTRL + H/L
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.move({ workspace = "+1", follow = false }))
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.move({ workspace = "-1", follow = false }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move Scrolling layout with SUPER + PERIOD and COMMA

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

-- Move Scrolling layout with SUPER + '.' and ','
hl.bind(mainMod .. " +  PERIOD", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " +  COMMA", hl.dsp.layout("move -col"))
-- Move Scrolling layout with mouse wheel horizonstal
hl.bind(mainMod .. " +  mouse_down", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " +  mouse_up", hl.dsp.layout("move -col"))
-- Guard to enable horizontal scrolling only on Scrolling layouts
local function scrolling_move(direction)
  local ws = hl.get_active_workspace()
  if not ws or ws.tiled_layout ~= "scrolling" then
    return
  end
  hl.dispatch(hl.dsp.layout("move " .. direction))
end
-- Move Scrolling layout with SUPER + mouse wheel horizontal
hl.bind(" + mouse_right", function()
  scrolling_move("+col")
end)
hl.bind(" + mouse_left", function()
  scrolling_move("-col")
end)

-- Swap Scrolling layout
hl.bind(mainMod .. " + CONTROL + COMMA", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + CONTROL + PERIOD", hl.dsp.layout("swapcol r"))

-- Toggle between Scrolling and Dwindle layouts
hl.bind(mainMod .. " + SHIFT + T", function()
  local ws = hl.get_active_workspace()
  if not ws then
    return
  end

  local new_layout = ws.tiled_layout == "dwindle" and "scrolling" or "dwindle"

  hl.workspace_rule({
    workspace = tostring(ws.id),
    layout = new_layout,
  })

  hl.notification.create({
    text = "󱂬    Workspace layout set to " .. new_layout,
    duration = 3000,
    icon = 5,
  })
end)
