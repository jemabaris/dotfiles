----------------------------
---- SPECIAL WORKSPACES ----
----------------------------

-- Sets "SUPER" key as main modifier
local mainMod = "SUPER"

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scratchpad terminal (Super + T to toggle)
hl.bind(mainMod .. " + T", hl.dsp.workspace.toggle_special("terminal"))
hl.on("hyprland.start", function()
  hl.exec_cmd("[workspace special:terminal silent] kitty --title scratchpad")
end)
hl.window_rule({ match = { title = "scratchpad" }, float = true, center = true, stay_focused = true, size = "1400 900" })

-- Special Obsidian workspace (Super + O to toggle)
hl.bind(mainMod .. " + O", hl.dsp.workspace.toggle_special("vault"))
hl.on("hyprland.start", function()
  hl.exec_cmd("[workspace special:vault silent] obsidian")
end)
hl.window_rule({ match = { class = "obsidian" }, float = true, center = true, size = "(monitor_w*0.8) (monitor_h*0.9)" })

-- Kitty dropdown Terminal (SUPER + DELETE to toggle)

local CONFIG = {
  class = "kitty-quaketerminal",
  cmd = "kitty --class kitty-quaketerminal",
  width_pct = 0.5,
  height_pct = 0.5,
  y_pct = 0.05,
  special_ws = "special:quaketerminal",
}

local state = {
  addr = nil,
  animating = false,
  launching = false,
}

local function get_win()
  if state.addr then
    local win = hl.get_window("address:" .. state.addr)
    if win then
      return win
    end
  end
  for _, c in ipairs(hl.get_windows()) do
    if c.class == CONFIG.class then
      state.addr = c.address
      return c
    end
  end
  return nil
end

local function toggle_quaketerminal()
  if state.animating then
    return
  end

  local win = get_win()
  if not win then
    state.launching = true
    hl.notification.create({ text = "Initializing Kitty Quake Terminal...", timeout = 1000 })
    hl.exec_cmd(CONFIG.cmd)
    return
  end

  local mon = hl.get_active_monitor()
  local active_ws = hl.get_active_workspace().name
  local w = math.floor(mon.width * CONFIG.width_pct)
  local h = math.floor(mon.height * CONFIG.height_pct)
  local x = math.floor(mon.x + (mon.width - w) / 2)
  local target_y = math.floor(mon.y + mon.height * CONFIG.y_pct)
  local hidden_y = mon.y - h - 250

  state.animating = true

  if win.workspace.name == active_ws then
    hl.dispatch(hl.dsp.window.set_prop({ window = "address:" .. win.address, prop = "no_anim", value = "0" }))
    hl.dispatch(hl.dsp.window.move({ window = "address:" .. win.address, x = x, y = hidden_y }))

    hl.timer(function()
      hl.dispatch(hl.dsp.window.set_prop({ window = "address:" .. win.address, prop = "no_anim", value = "1" }))
      hl.dispatch(
        hl.dsp.window.move({ window = "address:" .. win.address, workspace = CONFIG.special_ws, follow = false })
      )
      state.animating = false
    end, { timeout = 650, type = "oneshot" })
  else
    hl.dispatch(hl.dsp.window.set_prop({ window = "address:" .. win.address, prop = "no_anim", value = "1" }))
    hl.dispatch(hl.dsp.window.move({ window = "address:" .. win.address, workspace = active_ws, follow = false }))
    hl.dispatch(hl.dsp.window.float({ window = "address:" .. win.address, action = "on" }))
    hl.dispatch(hl.dsp.window.move({ window = "address:" .. win.address, x = x, y = hidden_y }))
    hl.dispatch(hl.dsp.window.resize({ window = "address:" .. win.address, x = w, y = h }))

    hl.timer(function()
      hl.dispatch(hl.dsp.window.set_prop({ window = "address:" .. win.address, prop = "no_anim", value = "0" }))
      hl.dispatch(hl.dsp.window.move({ window = "address:" .. win.address, x = x, y = target_y }))
      hl.dispatch(hl.dsp.focus({ window = "address:" .. win.address }))
      hl.timer(function()
        state.animating = false
      end, { timeout = 600, type = "oneshot" })
    end, { timeout = 50, type = "oneshot" })
  end
end

hl.window_rule({
  name = "quaketerminal-hybrid",
  match = { class = CONFIG.class },
  float = true,
  workspace = CONFIG.special_ws .. " silent",
  animation = "windowsMove, 1, 6, overshot, slidevert",
})

hl.on("workspace.active", function()
  local win = get_win()
  if win and win.workspace.name == CONFIG.special_ws and win.pinned then
    hl.dispatch(hl.dsp.window.pin({ window = "address:" .. win.address }))
  end
end)

hl.on("window.open", function(win)
  if win.class == CONFIG.class and state.launching then
    state.launching = false
    hl.timer(toggle_quaketerminal, { timeout = 400, type = "oneshot" })
  end
end)

hl.on("window.close", function(win)
  if win.address == state.addr or win.class == CONFIG.class then
    state.addr, state.animating, state.launching = nil, false, false
  end
end)

hl.bind("SUPER + DELETE", toggle_quaketerminal, { description = "Toggle Kitty Quake Terminal" })

return { toggle = toggle_quaketerminal }
