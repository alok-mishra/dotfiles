-- https://wezfurlong.org/wezterm/config/lua/config/index.html
-- ctrl + shift + l to see logs

local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}

-- maximize window on startup (disabled)
-- wezterm.on("gui-startup", function(cmd)
-- 	local tab, pane, window = mux.spawn_window(cmd or {})
-- 	window:gui_window():maximize()
-- end)

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- conditional config based on os
if string.find(wezterm.target_triple, "linux") then
	print("linux")
	config.window_decorations = "RESIZE" -- hides window title
elseif string.find(wezterm.target_triple, "windows") then
	print("windows")
	config.default_prog = { "bash", "--login", "-i" } -- setbash
end

config.check_for_updates = false
config.initial_rows = 48
config.initial_cols = 160

config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"

config.font =
	wezterm.font_with_fallback({ "Cascadia Code", "FiraCode Nerd Font", "Inconsolata Nerd Font", "FiraCode NFM" })
config.font_size = 10.0

config.color_scheme = "GruvboxDark"
-- config.color_scheme = "Catppuccin Mocha"

config.background = {
	{
		source = { File = wezterm.home_dir .. "/.config/wezterm/background.jpg" },
		-- opacity = 0.88,
		-- attachment = { Parallax = 0.2 },
		hsb = { hue = 1.0, saturation = 1.0, brightness = 0.2 },
	},
}

-- wezterm.get_builtin_color_schemes()

return config
