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
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal), { description = "Launch Kitty" })
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(terminal_alt), { description = "Launch Ghostty" })
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("vicinae toggle"), { description = "Toggle Vicinae" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser), { description = "Launch Firefox" })
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(browser_alt), { description = "Launch Zen Browser" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager), { description = "Launch File Manager" })
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("pkill waybar; waybar &"), { description = "Reload Waybar" })
hl.bind(mainMod .. " + CTRL + V", hl.dsp.exec_cmd("cursor-clip"), { description = "Clipboard Cursor-Clip" })
hl.bind(
  mainMod .. " + ALT + V",
  hl.dsp.exec_cmd("kitty --class clipse -e 'clipse'"),
  { description = "Clipboard Clipse" }
)

-- Hyprshot and Hyprpicker
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -an"), { description = "Hyprpicker" })
hl.bind("CONTROL + PRINT", hl.dsp.exec_cmd("hyprshot -m region"), { description = "Take Screenshot - Region" })
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m output"), { description = "Take Screenshot - Monitor" })

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
end, { description = "Toggle Rofi" })

-- Quake-style terminal DISABLED IN FAVOR OF THE "kitty_quake_terminal" FEATURE, SEE "features/kitty_quake_terminal.lua"
-- hl.bind(
--   mainMod .. " + BACKSPACE",
--   hl.dsp.exec_cmd("kitten quick-access-terminal --config ~/.config/kitty/quick-access-terminal.conf")
-- )

-- Close Window with SUPER + Q or SUPER + middle mouse button
-- local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- hl.bind(mainMod .. " + mouse:274", hl.dsp.window.close(), { mouse = true })
-- closeWindowBind:set_enabled(false)

-- Protected Close: Closes window with SUPER + Q or SUPER + middle mouse button, but only if it is not protected. See "features/protected_close.lua"
local protected_close = require("features.protected_close")

hl.bind(mainMod .. " + Q", protected_close.close_unless_protected, {
  description = "Close active window unless protected",
})

hl.bind(mainMod .. " + mouse:274", protected_close.close_unless_protected, {
  mouse = true,
  description = "Close active window with middle mouse unless protected",
})

-- Shutdown Hyprland
hl.bind(
  mainMod .. " + F12",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),
  { description = "Log out of Hyprland" }
)

-- Window management
hl.bind(mainMod .. " + I", hl.dsp.layout("togglesplit"), { description = " Toggle split orientation" }) -- dwindle only
hl.bind(mainMod .. " + M", hl.dsp.layout("swapsplit"), { description = "Swap split position" }) -- dwindle only
hl.bind(mainMod .. " + N", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }), { description = "Toggle fullscreen" })
hl.bind(mainMod .. " + ALT + P", hl.dsp.window.pseudo(), { description = "Toggle pseudo tiling" })

-- Toggle window float and pin it in one lambda function
hl.bind("SUPER + P", function()
  hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
  hl.dispatch(hl.dsp.window.pin())
end, { description = "Pin and float active window" })

-- Resize windows with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + up", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
hl.bind(mainMod .. " + down", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })

-- Move focus with mainMod + vim keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }), { description = "Focus window to the left" })
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }), { description = "Focus window to the right" })
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }), { description = "Focus window above" })
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }), { description = "Focus window below" })

-- Switch workspaces with mainMod  + SHIFT + vim keys
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.focus({ workspace = "+1" }), { description = "Focus next workspace" })
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.focus({ workspace = "-1" }), { description = "Focus previous workspace" })

-- Scroll through existing workspaces with SUPER + scroll
hl.bind(
  mainMod .. " + mouse_down",
  hl.dsp.focus({ workspace = "e+1" }),
  { description = "Focus next (non empty) workspace" }
)
hl.bind(
  mainMod .. " + mouse_up",
  hl.dsp.focus({ workspace = "e-1" }),
  { description = "Focus previous (non empty) workspace" }
)

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
hl.bind(
  mainMod .. " + CTRL + L",
  hl.dsp.window.move({ workspace = "+1", follow = false }),
  { description = "Move active window to next workspace silently" }
)
hl.bind(
  mainMod .. " + CTRL + H",
  hl.dsp.window.move({ workspace = "-1", follow = false }),
  { description = "Move active window to previous workspace silently" }
)

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
-- Resize while keeping aspect ratio (Temporary solution)
hl.bind(mainMod .. " + ALT + mouse:273", function()
  hl.dispatch(hl.dsp.window.set_prop({ prop = "keep_aspect_ratio", value = "1" }))
  hl.dispatch(hl.dsp.window.resize())
end, { mouse = true })
hl.bind(
  mainMod .. " + ALT + mouse:273",
  hl.dsp.window.set_prop({ prop = "keep_aspect_ratio", value = "false" }),
  { release = true, mouse = true }
)

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
hl.bind(hyper .. " + C", hl.dsp.exec_cmd("code"), { description = "Launch Visual Studio Code" })
hl.bind(
  hyper .. " + D",
  hl.dsp.exec_cmd("~/.local/bin/pkg-scripts/script-selector-rofi"),
  { description = "Open Rofi Script Selector" }
)
hl.bind(
  hyper .. " + E",
  hl.dsp.exec_cmd("rofi -modi emoji -show emoji -theme $HOME/rofi-collection/theme.rasi"),
  { description = "Open Rofi Emoji Selector" }
)
hl.bind(hyper .. " + G", hl.dsp.exec_cmd("gpu-screen-recorder-gtk"), { description = "Launch GPU Screen Recorder GTK" })
hl.bind(hyper .. " + L", hl.dsp.exec_cmd("lutris"), { description = "Launch Lutris" })
hl.bind(hyper .. " + N", hl.dsp.exec_cmd("kitty -e nvim"), { description = "Launch Neovim" })
hl.bind(hyper .. " + S", hl.dsp.exec_cmd("subl"), { description = "Launch Sublime Text" })
hl.bind(hyper .. " + T", hl.dsp.exec_cmd("Telegram"), { description = "Launch Telegram" })
hl.bind(hyper .. " + V", hl.dsp.exec_cmd("vesktop"), { description = "Launch Discord" })
hl.bind(hyper .. " + W", hl.dsp.exec_cmd("whatsdesk"), { description = "Launch Whatsapp" })
hl.bind(hyper .. " + Z", hl.dsp.exec_cmd("zeditor"), { description = "Launch Zed" })

-- Vicinae Deeplink keybinds
hl.bind(
  mainMod .. " + Z",
  hl.dsp.exec_cmd("vicinae 'vicinae://launch/wm/switch-windows'"),
  { description = "Vicinae Switch Windows" }
)
hl.bind(
  mainMod .. " + Slash",
  hl.dsp.exec_cmd("vicinae 'vicinae://launch/@brpaz/store.vicinae.brotab/tabs-list'"),
  { description = "Vicinae Tabs List" }
)
hl.bind(
  mainMod .. " + V",
  hl.dsp.exec_cmd("vicinae 'vicinae://launch/clipboard/history'"),
  { description = "Vicinae Clipboard History" }
)

-- Move Scrolling layout with SUPER + '.' and ','
hl.bind(mainMod .. " +  PERIOD", hl.dsp.layout("move +col"), { description = "Move right in Scrolling Layout" })
hl.bind(mainMod .. " +  COMMA", hl.dsp.layout("move -col"), { description = "Move left in Scrolling Layout" })
-- Move Scrolling layout with mouse wheel horizonstal
-- hl.bind(mainMod .. " +  mouse_down", hl.dsp.layout("move +col"))
-- hl.bind(mainMod .. " +  mouse_up", hl.dsp.layout("move -col"))
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
end, { description = "Move right in Scrolling Layout with mouse" })
hl.bind(" + mouse_left", function()
  scrolling_move("-col")
end, { description = "Move left in Scrolling Layout with mouse" })

-- Move left/right in Scrolling layout
hl.bind(mainMod .. " + CONTROL + COMMA", hl.dsp.layout("swapcol l"), { description = "Move left in Scrolling Layout" })
hl.bind(
  mainMod .. " + CONTROL + PERIOD",
  hl.dsp.layout("swapcol r"),
  { description = "Move right in Scrolling Layout" }
)

-- Enable Mi TV with SUPER + F5, disable with SUPER + F4
local tv = require("features.tv_toggle")

hl.bind(mainMod .. " + F4", tv.disable, { description = "Disable Mi TV" })
hl.bind(mainMod .. " + F5", tv.enable, { description = "Enable Mi TV" })

-----------------
---- SUBMAPS ----
-----------------

-- Multimedia kyes submap, hold mouse 'forward' button and scroll or click to control volume and playback
hl.config({ binds = { scroll_event_delay = 0 } })
local used_media = false

hl.bind("mouse:276", function()
  used_media = false
  hl.dispatch(hl.dsp.submap("volume"))
end)

hl.define_submap("volume", function()
  hl.bind("mouse_up", function()
    used_media = true
    hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
  end)
  hl.bind("mouse_down", function()
    used_media = true
    hl.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")
  end)
  hl.bind("mouse:272", function()
    used_media = true
    hl.exec_cmd("playerctl play-pause")
  end)
  hl.bind("mouse:273", function()
    used_media = true
    hl.exec_cmd("playerctl next")
  end)
  hl.bind("mouse:276", function()
    hl.dispatch(hl.dsp.submap("reset"))
    if not used_media then
      hl.dispatch(hl.dsp.send_key_state({ key = "mouse:276", state = "down", mods = "" }))
      hl.dispatch(hl.dsp.send_key_state({ key = "mouse:276", state = "up", mods = "" }))
    end
  end, { release = true })
end)

-- Allows dragging Picture-in-Picture windows with middle mouse drag and without holding SUPER
hl.bind("mouse:274", function()
  local active = hl.get_active_window()
  if active ~= nil and active.title == "Picture-in-Picture" then
    hl.dispatch(hl.dsp.window.drag())
  end
end, {
  mouse = true,
  non_consuming = true,
})
