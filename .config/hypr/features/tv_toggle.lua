----------------------
---- Mi TV TOGGLE ----
----------------------

-- local tv_enabled = false
--
-- local function toggle_tv()
--   tv_enabled = not tv_enabled
--   hl.monitor({
--     output = "HDMI-A-3",
--     disabled = not tv_enabled,
--     mode = "3840x2160@60",
--     position = "auto",
--     scale = "1",
--   })
--   hl.notification.create({
--     text = (tv_enabled and " 󰍺  " or " 󰶐  ") .. "  Mi TV " .. (tv_enabled and "connected" or "disconnected"),
--     duration = 3000,
--     icon = tv_enabled and 5 or 3,
--   })
-- end
--
-- return toggle_tv
----------------------
---- Mi TV TOGGLE ----
----------------------

local TV_OUTPUT = "HDMI-A-3"

local function sh(cmd)
  local f = io.popen(cmd)
  if not f then
    return nil
  end

  local out = f:read("*a")
  f:close()
  return out
end

local function is_tv_enabled()
  local cmd = ([[hyprctl -j monitors all | jq -r '.[] | select(.name == "%s") | .disabled']]):format(TV_OUTPUT)
  local out = sh(cmd)
  if not out then
    return false
  end

  out = out:gsub("%s+", "")
  if out == "true" then
    return false
  end
  if out == "false" then
    return true
  end

  return false
end

local function set_tv_enabled(enabled)
  hl.monitor({
    output = TV_OUTPUT,
    disabled = not enabled,
    mode = "3840x2160@60",
    position = "auto",
    scale = 1,
  })

  hl.notification.create({
    text = (enabled and " 󰍺  " or " 󰶐  ") .. " Mi TV " .. (enabled and "connected" or "disconnected"),
    duration = 3000,
    icon = enabled and 5 or 3,
  })
end

local function toggle_tv()
  local enabled = is_tv_enabled()
  set_tv_enabled(not enabled)
end

local function setup()
  set_tv_enabled(false)
end

return {
  toggle = toggle_tv,
  setup = setup,
}
