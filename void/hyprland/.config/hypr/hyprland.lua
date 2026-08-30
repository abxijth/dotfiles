-- =============================================================================
--  Hyprland 0.55+ configuration (Lua)
-- =============================================================================
--  The config is split into modules under ./modules/ and imported below.
--
--   modules/helpers       shared utilities (PATH/command detection)
--   modules/env           environment variables
--   modules/monitors      monitors setup
--   modules/settings      general / decoration / input / layouts / misc
--   modules/animations    animation curves & leaf presets
--   modules/devices       input devices & touch gestures
--   modules/binds         keybindings (auto-guarded to installed programs)
--   modules/window-rules  window / layer / workspace rules
--   modules/autostart     apps launched at login (auto-guarded)
--
--  Tip: after editing any file, run `hyprctl reload` (or SUPER + SHIFT + R).
-- =============================================================================

require("modules.env")
require("modules.monitors")
require("modules.settings")
require("modules.animations")
require("modules.devices")
require("modules.binds")
require("modules.window-rules")
require("modules.autostart")