return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			-- theme = "codedark",
			-- theme = "monokai-pro",
			theme = "catppuccin-latte",
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
	},
}
