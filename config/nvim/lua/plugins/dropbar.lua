return {
	"Bekaboo/dropbar.nvim",
	tag = "v8.6.1", -- pinning to aug 2024 release as TS source isn't working in main
	-- optional, but required for fuzzy finder support
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	config = function()
		local dropbar = require("dropbar").setup()

		local dropbar_api = require("dropbar.api")
		vim.keymap.set("n", "<leader>o", dropbar_api.pick, { desc = "Dr[o]pbar pick" })
	end,
}
