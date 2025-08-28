-- https://wezfurlong.org/wezterm/config/lua/config/index.html
-- ctrl + shift + l to see logs

local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- prevent infinite reloads
local wallpaper = wezterm.home_dir .. "/.config/wezterm/background.jpg"

local function randomBackground(dir)
    local success, files = pcall(wezterm.read_dir, dir)

    if success and files then
        local jpgs = {}
        for _, file in ipairs(files) do
            if file:match("%.jpe?g$") then
                table.insert(jpgs, file)
            end
        end
        if #jpgs > 0 then
            return jpgs[math.random(1, #jpgs)]
        end
    end
    return wallpaper
end

wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():set_position(200, 200)

    -- Random background only once at startup
    local bg_path = randomBackground(wezterm.home_dir .. "/sync/settings/backgrounds")
    window:gui_window():set_config_overrides({
        background = {
            {
                source = { File = bg_path },
                hsb = { hue = 1.0, saturation = 1.0, brightness = 0.06 },
            },
        },
    })
end)

-- conditional config based on os
if string.find(wezterm.target_triple, "linux") then
    wezterm.log_info("Running on Linux")
    config.window_decorations = "RESIZE" -- hides window title
    config.font = wezterm.font_with_fallback({ "FiraCode Nerd Font", "FiraCode NFM" })
elseif string.find(wezterm.target_triple, "windows") then
    wezterm.log_info("Running on Windows")
    config.default_prog = { "zsh", "--login", "-i" } -- set shell to bash
    config.font = wezterm.font_with_fallback({ "Cascadia Code", "FiraCode NFM" })
end


-- config.debug_key_events = true

config.check_for_updates = false
config.initial_rows = 40
config.initial_cols = 160

config.audible_bell = "Disabled"

config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"
config.font_size = 10.0

config.color_scheme = "GruvboxDark"
-- config.color_scheme = "Catppuccin Mocha"

-- config.disable_default_key_bindings = true (changed my mind)
config.keys = {
    { key = "\\", mods = "ALT|CTRL", action = wezterm.action.SplitHorizontal },
    { key = "|", mods = "SHIFT|ALT|CTRL", action = wezterm.action.SplitVertical },
    { key = "'", mods = "ALT|CTRL", action = wezterm.action.PaneSelect },
    { key = '"', mods = "ALT|CTRL|SHIFT", action = wezterm.action({ PaneSelect = { mode = "SwapWithActive" } }) },

    { key = "h", mods = "ALT", action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = "j", mods = "ALT", action = wezterm.action.ActivatePaneDirection 'Down' },
    { key = "k", mods = "ALT", action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = "l", mods = "ALT", action = wezterm.action.ActivatePaneDirection 'Right' },
}

return config
