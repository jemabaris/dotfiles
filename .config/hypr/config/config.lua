--------------
--- CONFIG ---
--------------

----------------
----  MISC  ----
----------------

hl.config({
  misc = {
    force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
    enable_swallow = true,
    swallow_regex = "^(kitty|ghostty|wezterm|foot|alacritty)$",
    focus_on_activate = true,
  },
})

---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout = "eu",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",

    follow_mouse = 1,

    sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

    touchpad = {
      natural_scroll = false,
    },
  },
})

-----------------
---- GESTURE ----
-----------------

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
----------------
---- DEVICE ----
----------------

hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5,
})

----------------
---- CURSOR ----
----------------

hl.config({
  cursor = {
    hide_on_key_press = true,
  },
})
