-- Keybindings.
-- Apps live in one place so swapping them only takes one edit.
-- Every external-command bind is guarded: if the program isn't installed
-- the bind is simply skipped (and appears once you install it + reload).

local has = require("modules.helpers").has

local apps = {
    terminal    = "alacritty",
    fileManager = "yazi",
    menu        = "rofi",
    browser     = "firefox",
}

local mainMod = "SUPER"   -- the "Windows"/"Meta" key

----------------------
--- LAUNCHING APPS ---
----------------------

-- Terminal, file manager, launcher
if has(apps.terminal)    then hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(apps.terminal)) end
if has(apps.browser)     then hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(apps.browser)) end
if has(apps.fileManager) then hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(apps.fileManager)) end
if has(apps.menu)        then hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(apps.menu)) end

-- Power off / exit
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))

-- Lock screen (install hyprlock, then enable)
if has("hyprlock") then
    hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("hyprlock"))
end

-- Screenshots: install grim + slurp + wl-clipboard, then reload
if has("grim") and has("slurp") and has("wl-copy") then
    -- selection region -> clipboard (nothing saved)
    hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))
    -- full screen -> ~/Pictures/Screenshots + clipboard
    hl.bind(mainMod .. " + S",         hl.dsp.exec_cmd("mkdir -p ~/Pictures/Screenshots && f=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png && grim \"$f\" && wl-copy -t image/png < \"$f\""))
end

----------------------
---- WINDOW OPS ------
----------------------

hl.bind(mainMod .. " + C",  hl.dsp.window.close())
hl.bind(mainMod .. " + V",  hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F",  hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + P",  hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J",  hl.dsp.layout("togglesplit"))  -- dwindle only

-- Window groups
hl.bind(mainMod .. " + T",         hl.dsp.group.toggle())
hl.bind(mainMod .. " + U",         hl.dsp.group.next())
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.group.prev())

-- Jump to the previously focused window
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ last = true }))

----------------------
------ FOCUS ----------
----------------------

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move the active window with mainMod + SHIFT + arrows
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down", group_aware = true }))

-- Send the active window to the previous / next monitor
hl.bind(mainMod .. " + ALT + left",  hl.dsp.window.move({ monitor = "-1" }))
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.move({ monitor = "+1" }))

----------------------
---- WORKSPACES ------
----------------------

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10  -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Scratchpad (special workspace "magic")
hl.bind(mainMod .. " + SHIFT + M",         hl.dsp.workspace.toggle_special("magic"))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

----------------------
----- MEDIA & HW -----
----------------------

-- Volume (pipewire)
if has("wpctl") then
    hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
    hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
    hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
    hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
end

-- Screen brightness
if has("brightnessctl") then
    hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
end

-- Media control (playerctl)
if has("playerctl") then
    hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
    hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
end

----------------------
----- SCREENSHOTS -----
----------------------

if has("grim") and has("wl-copy") then
    local shots = os.getenv("HOME") .. "/Pictures/Screenshots"
    -- Full screen: PrtScn  |  region: SUPER + PrtScn
    local save_copy = "mkdir -p " .. shots .. ' && f="' .. shots .. '/shot-$(date +%s%N).png"'
    hl.bind("Print",
        hl.dsp.exec_cmd(save_copy .. ' && grim "$f" && wl-copy -t image/png < "$f"'))
    if has("slurp") then
        hl.bind(mainMod .. " + Print",
            hl.dsp.exec_cmd(save_copy .. ' && grim -g "$(slurp)" "$f" && wl-copy -t image/png < "$f"'))
    end
end

-- Clipboard history (cliphist + launcher)
if has("cliphist") and has("wl-copy") and has(apps.menu) then
    hl.bind(mainMod .. " + SHIFT + V",
        hl.dsp.exec_cmd("cliphist list | " .. apps.menu .. " -dmenu | cliphist decode | wl-copy"))
end

----------------------
------- SYSTEM --------
----------------------

-- Reload the config
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
