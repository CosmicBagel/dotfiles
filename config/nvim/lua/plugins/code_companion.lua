local adapter = { name = "copilot", model = "claude-sonnet-5.5" } -- verify model ID

return {
	"olimorris/codecompanion.nvim",
	version = "^19.0.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		interactions = {
			chat = {
				adapter = adapter,
				sessions = {
					enabled = true,
					autosave = true,
					continuous_save = true,
					save_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "codecompanion", "sessions"),
				},
			},
			inline = { adapter = adapter },
		},
	},
	keys = {
		{
			"<leader>ac",
			"<cmd>CodeCompanionChat Toggle<cr>",
			mode = "n",
			desc = "CodeCompanion - Toggle chat",
		},
		{
			"<leader>ac",
			":CodeCompanionChat Add<cr>",
			mode = "v",
			desc = "CodeCompanion - Add selection to chat",
		},
		{
			"<leader>ai",
			":CodeCompanion #{buffer} ",
			mode = "n",
			desc = "CodeCompanion - Inline (with current buffer)",
		},
		{
			"<leader>ai",
			":CodeCompanion ",
			mode = "v",
			desc = "CodeCompanion - Inline (with selection)",
		},
		{
			"<leader>aa",
			"<cmd>CodeCompanionActions<cr>",
			mode = { "n", "v" },
			desc = "CodeCompanion - Open actions picker",
		},
	},
}
