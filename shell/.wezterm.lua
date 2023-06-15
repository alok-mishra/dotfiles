-- https://wezfurlong.org/wezterm/config/lua/config/index.html

local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}

-- maximize window on startup
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.default_prog = { "sh", "--login", "-i" } -- not needed as COMSPEC is set to bash.exe
-- config.default_prog = {"nvim"}

config.window_decorations = "RESIZE" -- hides window title
config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font("FiraCode NFM")
config.color_scheme = "Gruvbox Dark"

config.background = {
	{
		-- source = { File = wezterm.home_dir .. "/.config/w/dreamer.jpg" },
		source = { File = wezterm.home_dir .. "/dreamer.jpg" },
		-- opacity = 0.88,
		hsb = { hue = 1.0, saturation = 1.0, brightness = 0.2 },
	},
	-- {
	-- 	source = { File = wezterm.home_dir .. "/x.jpg" },
	-- 	opacity = 0.2,
	-- 	attachment = { Parallax = 0.2 },
	-- },
}

-- wezterm.get_builtin_color_schemes()

return config
