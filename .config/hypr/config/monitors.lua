------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- LG Ultrawide
hl.monitor({
  output = "DP-4",
  mode = "3440x1440@75",
  position = "0x0",
  scale = "1",
  bitdepth = 10,
})

-- LG OLED
hl.monitor({
  output = "DP-5",
  mode = "3840x2160@60",
  position = "3440x0",
  scale = "1",
  bitdepth = 10,
})

-- Mi TV (keep it disabled by default, toggle with the "tv_toggle" feature)
-- hl.monitor({
--   output = "HDMI-A-3",
--   disabled = true,
--   mode = "3840x2160@60",
--   position = "auto",
--   scale = "1",
-- })
