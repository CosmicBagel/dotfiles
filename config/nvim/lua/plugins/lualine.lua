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
		},
		sections = {
			lualine_c = {
				{
					function()
						return require("dap").status()
					end,
					icon = { "", color = { fg = "#e7c664" } }, -- nerd icon.
					cond = function()
						if not package.loaded.dap then
							return false
						end
						local session = require("dap").session()
						return session ~= nil
					end,
				},
			},
		},
	},
}
