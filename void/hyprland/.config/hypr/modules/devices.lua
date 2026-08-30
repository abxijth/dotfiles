-- Input devices & touch gestures.
-- Device names are yours (from `hyprctl devices`); adjust to match your hardware.

-- Built-in ELAN touchpad
hl.device({
    name                 = "elan06fa:00-04f3:327e-touchpad",
    enabled              = true,
    natural_scroll       = false,
    tap_to_click         = true,
    tap_and_drag         = true,
    disable_while_typing = true,
    -- scroll_method        = "two_finger",
})

-- Touch gestures
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

-- Per-device overrides work the same way. Example:
-- hl.device({
--     name        = "logitech-wireless-mouse-1",
--     sensitivity = -0.5,
-- })