return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			-- theme = "codedark",
			theme = "monokai-pro",
			-- theme = "catppuccin-latte",
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
		},
		extensions = {
			"lazy",
			"mason",
			"nvim-dap-ui",
			"oil",
			"quickfix",
			"trouble",
			"toggleterm",
			"nvim-tree",
		},
		sections = {
			lualine_b = {
				{ "b:gitsigns_head", icon = "" },
				{
					"diff",
					source = function()
						local gitsigns = vim.b.gitsigns_status_dict
						if gitsigns then
							return {
								added = gitsigns.added,
								modified = gitsigns.changed,
								removed = gitsigns.removed,
							}
						end
					end,
					symbols = { added = " ", modified = "󰥛 ", removed = " " },
				},
				"diagnostics",
			},
			lualine_c = {
				"filename",
				{
					function()
						return require("dap").status()
					end,
					icon = { " ", color = { fg = "#e7c664" } }, -- nerd icon.
					cond = function()
						if not package.loaded.dap then
							return false
						end
						local session = require("dap").session()
						return session ~= nil
					end,
				},
			},
			lualine_x = {
				"encoding",
				{
					"fileformat",
					icons_enabled = true,
					symbols = {
						unix = "LF",
						dos = "CRLF",
						mac = "CR",
					},
				},
				"filetype",
			},
		},
	},
}
