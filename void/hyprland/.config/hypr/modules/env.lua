-- Environment variables.
-- `hl.env(name, value, dbus?)` — dbus=true also applies them to the
-- D-Bus activation environment so graphical apps started later inherit them.

hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "18")
hl.env("HYPRCURSOR_SIZE", "18")

-- Best-practice Wayland hints for common toolkits (harmless if unused).
hl.env("XDG_SESSION_TYPE", "wayland", true)
hl.env("XDG_CURRENT_DESKTOP", "Hyprland", true)
hl.env("QT_QPA_PLATFORM", "wayland", true)
hl.env("MOZ_ENABLE_WAYLAND", "1", true)
hl.env("SDL_VIDEODRIVER", "wayland")
-- Some apps still behave better on X11 backend for now:
-- hl.env("GDK_BACKEND", "wayland,x11", true)