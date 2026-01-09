return {
	"Bekaboo/dropbar.nvim",
	-- optional, but required for fuzzy finder support
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	config = function()
		local dropbar = require("dropbar").setup()

		local dropbar_api = require("dropbar.api")
		vim.keymap.set("n", "<leader>o", dropbar_api.pick, { desc = "Dr[o]pbar pick" })
	end,
}
