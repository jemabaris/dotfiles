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
