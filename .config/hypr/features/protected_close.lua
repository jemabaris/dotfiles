---------------------------
---- PROTECTED WINDOWS ----
---------------------------
local M = {}

-- Define rules for windows that should be protected from accidental closure here
M.rules = {
  { class = "kitty", title = "scratchpad" },
  { class = "obsidian" },
  -- future examples:
  -- { title = "Picture-in-Picture" },
  -- { class = "firefox", title_contains = "Picture-in-Picture" },
}

local function matches_rule(win, rule)
  if not win then
    return false
  end

  if rule.class and win.class ~= rule.class then
    return false
  end

  if rule.title and win.title ~= rule.title then
    return false
  end

  if rule.class_contains and not string.find(win.class or "", rule.class_contains, 1, true) then
    return false
  end

  if rule.title_contains and not string.find(win.title or "", rule.title_contains, 1, true) then
    return false
  end

  return true
end

function M.is_protected(win)
  for _, rule in ipairs(M.rules) do
    if matches_rule(win, rule) then
      return true, rule
    end
  end

  return false, nil
end

function M.close_unless_protected()
  local win = hl.get_active_window()
  local protected = M.is_protected(win)

  if protected then
    return
  end

  hl.dispatch(hl.dsp.window.close())
end

return M
