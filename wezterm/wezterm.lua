local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Theme
config.color_scheme = 'Catppuccin Mocha'

-- Font
config.font = wezterm.font "Fira Code"
config.font_size = 14.0 

-- Font Ligatures
config.default_cursor_style = 'SteadyBlock'
config.cursor_blink_rate = 500 

-- Background
config.window_background_opacity = 0.95
config.win32_system_backdrop = 'Acrylic' 

-- ปรับแต่ง Tab Bar
config.use_fancy_tab_bar = true 
-- config.hide_tab_bar_if_only_one_tab = true 
config.tab_bar_at_bottom = false
config.colors = {
  tab_bar = {
    background = '#1a1b26',
    active_tab = {
      bg_color = '#414868', 
      fg_color = '#c0caf5', 
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color = '#24283b',
      fg_color = '#a9b1d6',
    },
    new_tab = {
      bg_color = '#1a1b26',
      fg_color = '#c0caf5',
    },
  },
}

-- Window
config.window_close_confirmation = 'NeverPrompt'
config.enable_tab_bar = true
config.window_decorations = 'TITLE | RESIZE' 
config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
} 

-- Scrollbar
-- config.enable_scroll_bar = true 
-- config.scroll_bar_position = 'Right' 

-- Keybindings
config.keys = {
  -- Split pane
  { key = 'd', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 's', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '|', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '-', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },

  --close split pane
  { key = 'q', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentPane { confirm = true } },
  
  -- Focus pane
  { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Left', 5 } },
  { key = 'RightArrow', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Right', 5 } },
  { key = 'UpArrow', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Up', 5 } },
  { key = 'DownArrow', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Down', 5 } },
}

return config
