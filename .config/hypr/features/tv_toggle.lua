----------------------
---- Mi TV TOGGLE ----
----------------------

local tv_enabled = false

local function toggle_tv()
  tv_enabled = not tv_enabled
  hl.monitor({
    output = "HDMI-A-3",
    disabled = not tv_enabled,
    mode = "3840x2160@60",
    position = "auto",
    scale = "1",
  })
  hl.notification.create({
    text = (tv_enabled and " 󰍺  " or " 󰶐  ") .. "  Mi TV " .. (tv_enabled and "connected" or "disconnected"),
    duration = 3000,
    icon = tv_enabled and 5 or 3,
  })
end

return toggle_tv
