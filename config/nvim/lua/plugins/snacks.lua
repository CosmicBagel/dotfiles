return {
	"snacks.nvim",
	opts = {
		terminal = {
			win = {
				keys = {
					nav_h = false,
					nav_l = false,
					hide_slash = false,
					hide_underscore = false,
					term_normal = false,

					hide_backtick = { "<C-`>", "hide", desc = "Hide Terminal", mode = { "t" } },
				},
			},
		},
		indent = {
			animate = { enabled = false },
		},
	},
	keys = {
		{ "<c-/>", false },
		{ "<c-_>", false },
		{ "<c-h>", false },
		{ "<c-l>", false },
		{ "<esc><esc>", false },
	},
}
