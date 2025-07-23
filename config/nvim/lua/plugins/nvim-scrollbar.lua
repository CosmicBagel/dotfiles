return {
	"petertriho/nvim-scrollbar",
	dependencies = { "lewis6991/gitsigns.nvim" },
	config = function(opts)
		require("scrollbar").setup({
			set_highlights = false,
			excluded_buftypes = {
				"terminal",
				"nofile", -- don't put scrollbar in little popup windows
			},
		})
		require("scrollbar.handlers.gitsigns").setup()
	end,
}
