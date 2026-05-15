----------------------
---- Mi TV TOGGLE ----
----------------------

local function enable_tv()
  hl.monitor({
    output = "HDMI-A-3",
    disabled = false,
    mode = "3840x2160@60",
    position = "auto",
    scale = "1",
  })
  hl.notification.create({
    text = "  󰍺   Mi TV connected",
    duration = 3000,
    icon = 5,
  })
end

local function disable_tv()
  hl.monitor({
    output = "HDMI-A-3",
    disabled = true,
    mode = "3840x2160@60",
    position = "auto",
    scale = "1",
  })
  hl.notification.create({
    text = "  󰶐   Mi TV disconnected",
    duration = 3000,
    icon = 3,
  })
end

return { enable = enable_tv, disable = disable_tv }
