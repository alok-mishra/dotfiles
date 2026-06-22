-- #############################################################################
-- DEFAULTS
-- #############################################################################
require("hyprland-defaults")

-- #############################################################################
-- PROGRAMS
-- #############################################################################

local terminal = "ghostty"

local mod      = "SUPER"
local malt     = "SUPER + ALT"

-- #############################################################################
-- AUTOSTART
-- #############################################################################

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
end)

-- #############################################################################
-- ENVIRONMENT VARIABLES
-- Note: if you use uwsm, prefer ~/.config/uwsm/env for most of these instead.
-- #############################################################################

hl.env("XDG_CONFIG_HOME", os.getenv("HOME") .. "/.config")
hl.env("MESA_GLSL_CACHE_DISABLE", "false")
hl.env("MESA_SHADER_CACHE_DIR", os.getenv("HOME") .. "/.cache/mesa_shader_cache")
-- WGPU_BACKEND is passed inline to the Zed bind below rather than globally.

-- #############################################################################
-- SETTINGS OVERRIDES
-- (only what differs from the defaults)
-- #############################################################################

hl.config({
    general = {
        gaps_in = 10,
        gaps_out = 10,
    },
    dwindle = {
        force_split = 2, -- always split right / bottom
    },
    misc = {
        disable_splash_rendering = true
    },
})

-- #############################################################################
-- WORKSPACE NAMES  (FontAwesome icons)
-- 1:Terminal  2:Web  3:Misc  4:Code  5:Social  6:Media  7-10:General
-- #############################################################################
hl.workspace_rule({ workspace = "1", default_name = "" })
hl.workspace_rule({ workspace = "2", default_name = "" })
hl.workspace_rule({ workspace = "3", default_name = "" })
hl.workspace_rule({ workspace = "4", default_name = "" })
hl.workspace_rule({ workspace = "5", default_name = "" })
hl.workspace_rule({ workspace = "6", default_name = "" })
hl.workspace_rule({ workspace = "7", default_name = "" })
hl.workspace_rule({ workspace = "8", default_name = "" })
hl.workspace_rule({ workspace = "9", default_name = "" })
hl.workspace_rule({ workspace = "10", default_name = "" })

-- #############################################################################
-- WINDOW RULES  (app-to-workspace assignments)
-- #############################################################################

hl.window_rule({ match = { class = "^firefox$" }, workspace = "2" })
hl.window_rule({ match = { class = "^(bcompare|Gimp|meld|krita|org.keepassxc.KeePassXC)$" }, workspace = "3" })
hl.window_rule({ match = { class = "^(dev.zed.Zed|Code)$" }, workspace = "4" })
hl.window_rule({ match = { class = "^chromium$" }, workspace = "5" })
hl.window_rule({ match = { class = "^Spotify$" }, workspace = "6" })

-- #############################################################################
-- KEYBINDS
-- #############################################################################

-- Unbinds
hl.unbind(mod .. " + Q")
hl.unbind(mod .. " + J")

-- Terminal
hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal))

-- Close window
hl.bind(mod .. " + Q", hl.dsp.window.close())

-- Fullscreen
hl.bind(mod .. " + space", hl.dsp.window.fullscreen())

-- Reload Hyprland and restart Waybar
hl.bind(mod .. " + SHIFT + R", function()
    hl.exec_cmd("hyprctl reload && killall waybar; waybar &")
end)

-- App launchers
hl.bind(mod .. " + CTRL + space", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mod .. " + SHIFT + CTRL + space", hl.dsp.exec_cmd("rofi -show calc"))
hl.bind(mod .. " + CTRL + F", hl.dsp.exec_cmd("fuzzel"))

-- Power menu
hl.bind(mod .. " + X", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/rofi/powermenu.sh"))

-- Apps  (SUPER+ALT shortcuts)
hl.bind(malt .. " + B", hl.dsp.exec_cmd("bcompare"))
hl.bind(malt .. " + C", hl.dsp.exec_cmd("chromium"))
hl.bind(malt .. " + V", hl.dsp.exec_cmd("code-insiders"))
hl.bind(malt .. " + F", hl.dsp.exec_cmd("firefox"))
hl.bind(malt .. " + K", hl.dsp.exec_cmd("keepassxc"))
hl.bind(malt .. " + M", hl.dsp.exec_cmd("speedcrunch"))
hl.bind(malt .. " + S", hl.dsp.exec_cmd("spotify"))
hl.bind(malt .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(malt .. " + W", hl.dsp.exec_cmd("google-chrome-stable"))
hl.bind(malt .. " + Z", hl.dsp.exec_cmd("env WGPU_BACKEND=gl MESA_SHADER_CACHE_DISABLE=false zeditor"))

-- ---- Focus (vim-style) -------------------------------------------------------
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))
-- ---- Move windows (vim-style) ------------------------------------------------
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- ---- Workspace navigation ----------------------------------------------------
hl.bind(mod .. " + CTRL + H", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + CTRL + L", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + Tab", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + SHIFT + Tab", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + CTRL + N", hl.dsp.focus({ workspace = "empty" }))
hl.bind(mod .. " + grave", hl.dsp.focus({ workspace = "previous" }))
hl.bind(mod .. " + Z", hl.dsp.layout("togglesplit"))

-- ---- Move window to workspace and follow -------------------------------------
hl.bind(mod .. " + SHIFT + CTRL + H", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mod .. " + SHIFT + CTRL + L", hl.dsp.window.move({ workspace = "e+1" }))

-- ---- Brightness --------------------------------------------------------------
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })

-- ---- Volume ------------------------------------------------------------------
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

-- ---- Media (playerctl) -------------------------------------------------------
hl.bind(mod .. " + CTRL + bracketleft", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind(mod .. " + CTRL + bracketright", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind(mod .. " + CTRL + backslash", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

-- ---- Resize submap -----------------------------------------------------------
hl.bind(mod .. " + W", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
    hl.bind("H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind("K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind("J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
    hl.bind("Return", hl.dsp.submap("reset"))
    hl.bind("Escape", hl.dsp.submap("reset"))
    hl.bind(mod .. " + W", hl.dsp.submap("reset"))
end)
