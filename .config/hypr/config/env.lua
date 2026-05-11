-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- Program Variables
hl.env("EDITOR", "nvim")
hl.env("TERMINAL", "kitty")
hl.env("FILEMANAGER", "dolphin")
hl.env("BROWSER", "firefox")

-- Cursor Variables
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")

-- Nvidia Variables
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- Toolkit Backend Variables
hl.env("GDK_BACKEND", "wayland, x11, *")

-- XDG Specification Variables
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- KDE Variables
hl.env("KDE_FULL_SESSION", "true")
hl.env("KDE_SESSION_VERSION", "6")

-- Rofi Variables
hl.env("ROFI_FONT", "JetBrainsMono Nerd Font Propo Medium 12")

-- Hyprshot Variables
hl.env("HYPRSHOT_DIR", "/home/janis/Pictures/Screenshots/")

-- QT Variables
hl.env("QT_WAYLAND_DISABLE_WINDOW_DECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "kde")
-- hl.env("QT_STYLE_OVERRIDE", "kvantum-dark")

-- Keychain Variables
hl.env("SSH_ASKPASS_REQUIRE", "never")
