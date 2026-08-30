-- Autostart applications.
-- Everything is guarded: a program is only launched if it's installed,
-- so this file is safe to enable on a minimal system.

local has = require("modules.helpers").has

hl.on("hyprland.start", function()
    -- Status bar
    if has("waybar") then hl.exec_cmd("waybar") end

    -- Wallpaper daemon
    local wallpaper = os.getenv("HOME") .. "/Pictures/Wallpapers/wallpaper.png"
    if has("swaybg") then
        hl.exec_cmd("swaybg -i " .. wallpaper .. " -m fill")
    end

    -- Network manager applet (only makes sense with a tray/bar)
    if has("nm-applet") then hl.exec_cmd("nm-applet") end

    -- Audio (PipeWire session)
    if has("pipewire")      then hl.exec_cmd("pipewire") end
    if has("wireplumber")   then hl.exec_cmd("wireplumber") end
    if has("pipewire-pulse") then hl.exec_cmd("pipewire-pulse") end

    -- Notification daemon
    if has("dunst")  then hl.exec_cmd("dunst") end
    if has("swaync") then hl.exec_cmd("swaync") end

    -- Clipboard manager
    if has("cliphist") then
        hl.exec_cmd("wl-paste --type text --watch cliphist store")
    end

    -- Anything else you always want on login:
    -- if has("firefox") then hl.exec_cmd("firefox") end
end)
