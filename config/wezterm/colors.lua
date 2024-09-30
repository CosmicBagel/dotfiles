local wezterm = require("wezterm")

local me_colors = { -- The default text color foreground = '#ffffff', The default background color
	background = "#000000",

	-- the foreground color of selected text
	selection_fg = "#000000",
	-- the background color of selected text
	selection_bg = "#ffffff",

	-- Visual bell
	-- visual_bell = '#0b0e14',
	-- visual_bell = "#000000",
	visual_bell = "#2b292c",

	cursor_bg = "#fcfcfa",
	cursor_fg = "#2d2a2e",
	cursor_border = "#ffffff",

	-- changes cursor color when LEADER key is active
	compose_cursor = "orange",

	ansi = {
		"#1a1a1a", -- black
		"#df0008", -- red
		"#98e024", -- green
		"#fa8419", -- yellow
		"#2179ff", -- blue
		"#e745ff", -- magenta
		"#58d1eb", -- cyan
		"#c4c5b5", -- white
	},
	brights = {
		"#625e4c", -- black
		"#df0008", -- red
		"#98e024", -- green
		"#e0d561", -- yellow
		"#2179ff", -- blue
		"#e745ff", -- magenta
		"#58d1eb", -- cyan
		"#f6f6ef", -- white
	},

	-- tab bar colors
	tab_bar = {
		background = "rgba(0, 0, 0, 90%)",

		-- The new tab button that let you create new tabs
		new_tab = {
			bg_color = "rgba(51, 51, 51, 100%)",
			fg_color = "#bbbbbb",
		},
	},
}

local M = {}

M.apply_colors = function(config)
	local schemename = "MonokaiPro (Gogh)"
	-- local schemename = "Catppuccin Latte"
	local scheme = wezterm.get_builtin_color_schemes()[schemename]
	-- use monokai pro as base, but set background color to black

	-- scheme.background = me_colors.background
	scheme.visual_bell = me_colors.visual_bell
	scheme.compose_cursor = me_colors.compose_cursor

	config.color_schemes = {
		[schemename] = scheme,
	}
	config.color_scheme = schemename
end

return M
