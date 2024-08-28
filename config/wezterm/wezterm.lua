local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- In practice I found hot reloading to be really annoying
-- especially since I usually edit inside the terminal lol
config.automatically_reload_config = false

-- Almost never want the window size to change when increasing or decreasing
-- font size (aka zooming in and out with ctrl + and ctrl -)
config.adjust_window_size_when_changing_font_size = false

-- Env
config.term = "xterm-256color"

-- Font
config.font = wezterm.font({ family = "JetBrains Mono" })
config.font_size = 11
config.cursor_thickness = 0.20

-- Scroll history
config.scrollback_lines = 1000000

-- Window
config.initial_rows = 52
config.initial_cols = 171
config.window_background_opacity = 0.996
config.window_decorations = "NONE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.hide_mouse_cursor_when_typing = true

-- Visual bell
config.visual_bell = {
	fade_in_function = "Linear",
	fade_in_duration_ms = 0,
	fade_out_function = "Linear",
	fade_out_duration_ms = 100,
}

-- Tab bar
require("tabbar").apply_tab_bar_config(config)

-- Colors
require("colors").apply_colors(config)

-- Key bindings
config.enable_kitty_keyboard = true -- needed for neovim keybindings
config.disable_default_key_bindings = true
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 1500 }
config.keys = require("keys")

return config
