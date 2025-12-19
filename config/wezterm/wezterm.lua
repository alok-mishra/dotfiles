local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}
local shell = nil

if wezterm.config_builder then
    config = wezterm.config_builder()
end

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
    return nil
end

local function setRandomBackground(window)
    local bg_path = randomBackground(wezterm.home_dir .. "/sync/settings/backgrounds")

    if not bg_path then
        bg_path = randomBackground(wezterm.home_dir .. "/.config/backgrounds")
    end

    if bg_path then
        wezterm.log_info("Background: " .. bg_path:match("([^/\\]+)$"))
        window:set_config_overrides({
            background = {
                {
                    source = { File = bg_path },
                    hsb = { hue = 1.0, saturation = 1.0, brightness = 0.06 },
                },
            },
        })
    end
end

if wezterm.target_triple:find("windows") then

  -- config.default_prog = { "wsl" } -- launch wsl

  local wsl_domains = wezterm.default_wsl_domains()
  local wsl_default = wsl_domains[1] and wsl_domains[1].name

  wezterm.log_info("WSL domains detected:")
  for i, dom in ipairs(wsl_domains) do
    wezterm.log_info(string.format("  %d: %s", i, dom.name))
  end

  if wsl_default then
    config.default_domain = wsl_default
    shell = wsl_default
  else
    local success, _, _ = wezterm.run_child_process({"where.exe", "zsh.exe"})
    if success then
      config.default_prog = { "zsh.exe", "--login", "-i" }
      shell = "Zsh"
    else
      local bash_success, _, _ = wezterm.run_child_process({"where.exe", "bash.exe"})
      if bash_success then
        config.default_prog = { "bash.exe", "--login", "-i" }
        shell = "Bash"
      else
        config.default_prog = { "cmd.exe" }
        shell = "CMD"
      end
    end
  end

elseif wezterm.target_triple:find("linux") then
  config.window_decorations = "RESIZE" -- hides window title
end

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui = window:gui_window()

  gui:set_position(200, 200)

  setRandomBackground(gui)

end)

wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
  return shell .. " - " .. tab.active_pane.title
end)

config.font = wezterm.font_with_fallback({ "Cascadia Code", "FiraCode NFM" })

config.initial_rows = 40
config.initial_cols = 160
config.enable_scroll_bar = true

config.audible_bell = "Disabled"
config.check_for_updates = false
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"
config.skip_close_confirmation_for_processes_named = { "bash", "sh", "zsh", "fish", "tmux" }

config.font_size = 10.0
config.color_scheme = "GruvboxDark"

-- config.debug_key_events = true
-- config.disable_default_key_bindings = true

config.keys = {
    { key = "w", mods = "ALT", action = wezterm.action.CloseCurrentTab { confirm = false } },
    { key = "h", mods = "CTRL", action = wezterm.action.ActivateTabRelative(-1) },
    { key = "l", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },

    { key = "\\", mods = "ALT|CTRL", action = wezterm.action.SplitVertical },
    { key = "|", mods = "SHIFT|ALT|CTRL", action = wezterm.action.SplitHorizontal },
    { key = "'", mods = "ALT|CTRL", action = wezterm.action.PaneSelect },
    { key = '"', mods = "ALT|CTRL|SHIFT", action = wezterm.action({ PaneSelect = { mode = "SwapWithActive" } }) },

    { key = "h", mods = "ALT", action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = "j", mods = "ALT", action = wezterm.action.ActivatePaneDirection 'Down' },
    { key = "k", mods = "ALT", action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = "l", mods = "ALT", action = wezterm.action.ActivatePaneDirection 'Right' },

    { key = "r", mods = "CTRL|SHIFT", action = wezterm.action_callback(function(window, pane)
        setRandomBackground(window)
    end) },

    -- Domain switching keybindings
    { key = " ", mods = "CTRL|ALT", action = wezterm.action.ShowLauncher },

    { key = "z", mods = "CTRL|SHIFT", action = wezterm.action_callback(function(window, pane)
        local zsh_exists, _, _ = wezterm.run_child_process({"where.exe", "zsh.exe"})
        if zsh_exists then
            window:perform_action(wezterm.action.SpawnCommandInNewTab {
                label = "Native Zsh",
                domain = { DomainName = "local" },
                args = { "zsh.exe", "--login", "-i" },
            }, pane)
        else
            local bash_exists, _, _ = wezterm.run_child_process({"where.exe", "bash.exe"})
            if bash_exists then
                window:perform_action(wezterm.action.SpawnCommandInNewTab {
                    label = "Native Bash",
                    domain = { DomainName = "local" },
                    args = { "bash.exe", "--login", "-i" },
                }, pane)
            end
        end
    end) },
}

return config
