return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function() -- This is the function that runs, AFTER loading
		require("which-key").setup({
			preset = "modern",
			win = {
				border = "rounded",
			},
		})

		-- Document existing key chains
		require("which-key").add({
			{ "<leader>b", group = "De[b]ug" },
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>g", group = "[G]it" },
			{ "<leader>j", group = "Split/[j]oin (treesj)" },
			{ "<leader>p", group = "Buffers" },
			{ "<leader>q", group = "[Q]uack" },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>w", group = "[W]orkspace" },
			{ "<leader>x", group = "Diagnostics (Trouble)" },
		})
	end
}
