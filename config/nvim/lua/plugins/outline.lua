return {
	"hedyhli/outline.nvim",
	config = function()
		vim.keymap.set("n", "<leader>O", "<cmd>Outline<CR>", { desc = "Toggle [O]utline" })

		require("outline").setup({
			outline_window = {
				width = 20,
			}
		})
	end,
}
