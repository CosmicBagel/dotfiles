return {
	"petertriho/nvim-scrollbar",
	dependencies = { "lewis6991/gitsigns.nvim" },
	config = function(opts)
		require("scrollbar").setup({
			set_highlights = false,
		})
	end,
}
