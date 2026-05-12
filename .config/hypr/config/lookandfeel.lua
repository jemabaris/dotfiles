-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 15,

    border_size = 2,

    col = {
      active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },

    -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = true,
    hover_icon_on_border = false,

    -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
    allow_tearing = false,

    layout = "dwindle",
  },

  decoration = {
    rounding = 14,
    rounding_power = 2.5,

    -- Change transparency of focused and unfocused windows
    active_opacity = 1.0,
    inactive_opacity = 0.95,
    dim_inactive = true,
    dim_strength = 0.05,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },

    blur = {
      enabled = true,
      size = 8,
      passes = 4,
      vibrancy = 0.1696,
      xray = true,
    },
  },

  animations = {
    enabled = true,
  },
})
