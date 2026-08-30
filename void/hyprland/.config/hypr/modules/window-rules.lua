-- Window, layer and workspace rules.
-- Reference: https://wiki.hypr.land/Configuring/Basics/Window-Rules/
--            https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Ignore maximize requests from all apps. You'll probably like this.
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- Don't animate the wallpaper layer surfaces (saves GPU work on switch)
hl.layer_rule({
    name    = "wallpaper-no-anim",
    match   = { namespace = "^(hyprpaper|swaybg|mpvpaper)$" },
    no_anim = true,
    blur    = false,
})

-- Keep a couple of workspaces alive and give them names.
-- hl.workspace_rule({
--     workspace  = "1",
--     persistent = true,
--     default_name = "term",
-- })
-- hl.workspace_rule({
--     workspace  = "2",
--     persistent = true,
--     default_name = "web",
-- })

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)