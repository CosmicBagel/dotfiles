return {
	"kosayoda/nvim-lightbulb",
	config = function()
		require("nvim-lightbulb").setup({
			autocmd = { enabled = true,
				events = { "CursorHold", },
			},
			sign = {enabled = true },
			number = {enabled = true },
		})
	end,
}
