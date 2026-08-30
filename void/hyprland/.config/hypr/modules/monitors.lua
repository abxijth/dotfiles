-- Monitor configuration.
-- Get your own values from: hyprctl monitors

-- Fallback entry: any monitor without a dedicated rule below.
-- Keeps newly plugged-in displays usable instead of disabled.
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})

-- Built-in laptop display.
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@144.00200",
    position = "0x0",
    scale    = 1.20, -- currently resolves to 1.5; set a fixed value if you prefer

})

-- Change the scale off the hardware-inferred value:
--   scale = 1.5

-- Extra monitor example:
-- hl.monitor({
--     output   = "HDMI-A-1",
--     mode     = "1920x1080@144",
--     position = "auto-right",
--     scale    = 1,
-- })
