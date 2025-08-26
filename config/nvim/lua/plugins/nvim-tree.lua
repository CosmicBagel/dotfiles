return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		vim.keymap.set(
			"n",
			"<leader>t",
			":NvimTreeToggle<cr>",
			{ noremap = true, silent = true, desc = "Toggle Nvim-[T]ree" }
		)

		require("nvim-tree").setup({
			update_focused_file = {
				enable = true,
			},
			view = {
				width = '20%',
			},
			filters = {
				git_ignored = false,
				dotfiles = false,
			},
		})
	end,
}
