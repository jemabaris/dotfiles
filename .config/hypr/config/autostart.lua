-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
-- hl.on("hyprland.start", function ()
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
-- end)

hl.on("hyprland.start", function()
  local cmds = {
    "awww-daemon",
    "waybar",
    "swaync",
    "openrgb --startminimized --profile Janis_OpenRGB_01",
    --     "wl-clip-persist --clipboard regular",
    "systemctl --user start hyprpolkitagent",
    "systemctl --user start mpd",
    "keychain --clear --quiet",
    "cursor-clip --daemon",
    --     "hyprshell run",
    "vicinae server",
    "clipse -listen",
    "solaar --window=hide",
    --         "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
    --         "gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Ice",
    --         "hyprctl setcursor Bibata-Modern-Ice 24",
    --         "wl-paste --type text --watch cliphist -max-items=35 store",
    --         "wl-paste --type image --watch cliphist -max-items=10 store",
    --         "gammastep-indicator",
    --         "/usr/lib/xfce-polkit/xfce-polkit",
    --         "hypridle",
    --         "nwg-dock-hyprland -p left -d -w 5 -nolauncher -ml 5 -l top -hl bottom -i 40",
    --         "brightnessctl -s -d asus::kbd_backlight",
    --         "~/.local/bin/at_startup"
  }
  for _, cmd in ipairs(cmds) do
    hl.exec_cmd(cmd)
  end
end)
