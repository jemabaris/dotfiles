--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

----------------------
---- WINDOW RULES ----
----------------------

-- Picture-in-Picture rule
hl.window_rule({
  name = "pip",
  match = { title = "Picture-in-Picture" },
  float = true,
  pin = true,
  keep_aspect_ratio = true,
  size = "50% 20%",
  move = "2876 62",
  no_initial_focus = true,
  suppress_event = "activatefocus",
})

-- Float and center apps
local function floating_window(class, w, h)
  w, h = w or 800, h or 600
  hl.window_rule({
    match = { class = class },
    float = true,
    size = w .. " " .. h,
  })
end

floating_window("org.pulseaudio.pavucontrol")
floating_window("io.github.kaii_lb.Overskride")
floating_window("xdg-desktop-portal-gtk", 1000, 600)
floating_window("kvantummanager")
floating_window("nm-connection-editor")
floating_window("localsend", 1200, 800)
floating_window("io.ente.auth", 500, 800)

-- Vicinae layerrules
hl.layer_rule({
  name = "vicinae",
  match = { namespace = "vicinae" },
  blur = true,
  ignore_alpha = 0,
  no_anim = true,
})

-- Affinity Photo 2 windowrules
hl.window_rule({
  name = "affinity-photo-2",
  match = { class = "Affinity Photo 2" },
  no_blur = true,
  no_dim = true,
  opacity = 1.0,
  focus_on_activate = true,
})

-- Example window rules that are useful
local suppressMaximizeRule = hl.window_rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name = "suppress-maximize-events",
  match = { class = ".*" },

  suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },

  no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
  name = "move-hyprland-run",
  match = { class = "hyprland-run" },

  move = "20 monitor_h-120",
  float = true,
})

-------------------------
---- WORKSPACE RULES ----
-------------------------

hl.workspace_rule({ workspace = "1", monitor = "DP-4", persistent = true, default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-4" })
hl.workspace_rule({ workspace = "3", monitor = "DP-4" })
hl.workspace_rule({ workspace = "4", monitor = "DP-4" })
hl.workspace_rule({ workspace = "5", monitor = "DP-5", persistent = true, default = true })
hl.workspace_rule({ workspace = "6", monitor = "DP-5" })
hl.workspace_rule({ workspace = "7", monitor = "DP-5" })
hl.workspace_rule({ workspace = "8", monitor = "DP-5" })
hl.workspace_rule({ workspace = "9", monitor = "DP-5" })
hl.workspace_rule({ workspace = "10", monitor = "DP-5" })

-- Apps to open on specific workspaces
-- Workspace #8
hl.window_rule({
  match = { class = "whatsdesk|vesktop|org.telegram.desktop" },
  workspace = 8,
})
------------------------------
---- PER WORKSPACE LAYOUT ----
------------------------------

hl.workspace_rule({ workspace = "8", layout = "scrolling" })
hl.workspace_rule({ workspace = "9", layout = "scrolling" })
hl.workspace_rule({ workspace = "10", layout = "scrolling" })
