-- Core settings.
-- Reference: https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    general = {
        gaps_in         = 0,
        gaps_out        = 0,
        border_size     = 1,
        resize_on_border = false,

        -- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/
        allow_tearing = false,

        layout = "dwindle",

        col = {
            active_border   = "rgba(33ccffee)", 
            inactive_border = "rgba(595959aa)",
        },

        -- Snap floating windows to each other / screen edges while dragging.
        snap = {
            enabled     = true,
            window_gap  = 10,
            monitor_gap = 10,
        },
    },

    decoration = {
        rounding           = 0,
        rounding_power     = 2,
        active_opacity     = 0.99,
        inactive_opacity   = 0.94,
        fullscreen_opacity = 1.0,

        blur = {
            enabled = false,
        },

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },
    },

    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = 0, -- -1.0 .. 1.0, 0 = no modification

        touchpad = {
            natural_scroll = false,
            tap_to_click   = true,
        },
    },

    cursor = {
        no_hardware_cursors = 2, -- auto: disable only when tearing
        -- inactive_timeout   = 3, -- hide the cursor while idle, 0 = never
    },

    -- Layouts
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    scrolling = {
        fullscreen_on_one_column = true,
    },

    misc = {
        -- Set to 0 or 1 to disable the anime mascot wallpapers.
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
        focus_on_activate       = true, -- honor apps' "activate" requests
    },
})
