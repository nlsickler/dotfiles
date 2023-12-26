-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action
local wezMods = 'CTRL|SHIFT'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night'
config.font = wezterm.font 'MonaspiceAr Nerd Font Mono'

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}



config.keys = {
    { mods = 'ALT', key = 'f', action = act.ToggleFullScreen, },
    { mods = 'ALT', key = 'l', action = act.ShowLauncher },
    { mods = wezMods, key = '_', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { mods = wezMods, key = '|', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { mods = wezMods, key = 'W', action = act.CloseCurrentPane { confirm = true } },
    { mods = wezMods, key = 'S', action = act.PaneSelect }, -- Select different panes
    { mods = wezMods, key = 'H', action = act.AdjustPaneSize {'Left', 5} },
    { mods = wezMods, key = 'J', action = act.AdjustPaneSize {'Down', 5} },
    { mods = wezMods, key = 'K', action = act.AdjustPaneSize {'Up', 5} },
    { mods = wezMods, key = 'L', action = act.AdjustPaneSize {'Right', 5} },
}

config.font_size = 11
config.default_prog = { 'pwsh.exe', '-NoLogo' }

-- and finally, return the configuration to wezterm
return config
