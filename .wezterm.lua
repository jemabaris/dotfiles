-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

----------------------------------------------------------------------
-- UI tweaks
----------------------------------------------------------------------
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.8 -- opacity as you please
config.kde_window_background_blur = true
-- config.window_decorations = "RESIZE"

----------------------------------------------------------------------
--  tweaks
----------------------------------------------------------------------
-- config.front_end = "WebGpu"
-- config.max_fps = 120
-- config.animation_fps = 120

----------------------------------------------------------------------
-- Window geometry
----------------------------------------------------------------------
config.initial_cols = 180
config.initial_rows = 48
config.window_padding = {
  left = 10,
  right = 10,
  top = 30,
  bottom = 6,
}

----------------------------------------------------------------------
-- Color scheme
----------------------------------------------------------------------
config.color_scheme = "tokyonight_moon" -- #222436

----------------------------------------------------------------------
-- Cursor settings
----------------------------------------------------------------------
config.default_cursor_style = "SteadyBlock"

----------------------------------------------------------------------
-- Font settings
----------------------------------------------------------------------
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 12
config.line_height = 1.1

----------------------------------------------------------------------
-- Leader key (Ctrl+Space)
----------------------------------------------------------------------
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }

----------------------------------------------------------------------
-- Keybindings
----------------------------------------------------------------------
config.keys = {
  ----------------------------------------------------------------------
  -- Tabs (Super = Cmd on macOS, Win key on Windows/Linux)
  ----------------------------------------------------------------------
  --{ key = "t", mods = "SUPER", action = act.SpawnTab("CurrentPaneDomain") },
  --{ key = "w", mods = "SUPER", action = act.CloseCurrentTab({ confirm = true }) },
  { key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
  { key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },

  ----------------------------------------------------------------------
  -- Panes (Leader like tmux)
  ----------------------------------------------------------------------
  --   { key = "%", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  --   { key = '"', mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },

  ----------------------------------------------------------------------
  -- Vim-style pane navigation
  ----------------------------------------------------------------------
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

  ----------------------------------------------------------------------
  -- Resize panes (Leader + Shift + hjkl)
  ----------------------------------------------------------------------
  { key = "H", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Left", 10 }) },
  { key = "J", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Down", 10 }) },
  { key = "K", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Up", 10 }) },
  { key = "L", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Right", 10 }) },

  ----------------------------------------------------------------------
  -- Reload config
  ----------------------------------------------------------------------
  { key = "r", mods = "LEADER", action = act.ReloadConfiguration },

  ----------------------------------------------------------------------
  -- Launcher
  ----------------------------------------------------------------------
  { key = "p", mods = "LEADER", action = act.ShowLauncher },

  ----------------------------------------------------------------------
  -- Optional: Zoom pane like tmux (Leader + z)
  ----------------------------------------------------------------------
  { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
}

----------------------------------------------------------------------

-- Finally, return the configuration to wezterm:
return config
