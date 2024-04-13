local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Env
config.term = 'wezterm'

-- Font
config.font = wezterm.font { family = "Hack" }
config.font_size = 13
config.cursor_thickness = 0.20

-- Scroll history
config.scrollback_lines = 1000000

-- Window
config.initial_rows = 36
config.initial_cols = 110
config.window_background_opacity = 0.80
config.window_decorations = "NONE"
config.window_padding = { 
    left = 0,
    right = 0,
    top = 0,
    bottom = 0 
}

config.hide_mouse_cursor_when_typing = true

-- Visual bell
config.visual_bell = {
  fade_in_function = 'Linear',
  fade_in_duration_ms = 0,
  fade_out_function = 'Linear',
  fade_out_duration_ms = 100,
}

-- Tab bar
require('tabbar').apply_tab_bar_config(config)

-- Colors
config.colors = require("colors")

-- Key bindings
config.enable_kitty_keyboard = true -- needed for neovim keybindings
config.disable_default_key_bindings = true
config.leader = { key = 'b', mods = 'CMD', timeout_milliseconds = 1500 }
config.keys = require("keys")

return config
