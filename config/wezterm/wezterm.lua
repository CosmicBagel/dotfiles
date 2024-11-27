local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- In practice I found hot reloading to be really annoying
-- especially since I usually edit inside the terminal lol
config.automatically_reload_config = false

-- Almost never want the window size to change when increasing or decreasing
-- font size (aka zooming in and out with ctrl + and ctrl -)
config.adjust_window_size_when_changing_font_size = false

-- Shell
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "pwsh.exe", "-NoLogo" }
end

-- Env
config.term = "xterm-256color"
-- config.term = "wezterm"

-- Font
config.font = wezterm.font({ family = "JetBrains Mono" })
config.font_size = 11
config.cursor_thickness = 0.20

-- Scroll history
config.scrollback_lines = 1000000

-- Window
config.initial_rows = 37
config.initial_cols = 130

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.75
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

config.ssh_domains = {
	{
		-- This name identifies the domain
		name = "msiarch_home_wired",
		-- The hostname or address to connect to. Will be used to match settings
		-- from your ssh config file
		remote_address = "192.168.1.106",
		-- The username to use on the remote host
		username = "sam",

		-- the wezterm multiplexer causes issues for me in nvim
		multiplexing = "None",
	},
	{
		-- This name identifies the domain
		name = "msiarch_home_wifi",
		-- The hostname or address to connect to. Will be used to match settings
		-- from your ssh config file
		remote_address = "10.57.63.42",
		-- The username to use on the remote host
		username = "sam",

		-- the wezterm multiplexer causes issues for me in nvim
		multiplexing = "None",
	},
	{
		-- This name identifies the domain
		name = "msiarch_work_wired",
		-- The hostname or address to connect to. Will be used to match settings
		-- from your ssh config file
		remote_address = "10.51.98.209",
		-- The username to use on the remote host
		username = "sam",

		-- the wezterm multiplexer causes issues for me in nvim
		multiplexing = "None",
	},
}

return config
