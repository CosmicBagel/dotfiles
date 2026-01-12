return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"lawrence-laz/neotest-zig",
		"fredrikaverpil/neotest-golang",
		"thenbe/neotest-playwright",
	},
	keys = {
		{ "<leader>n", "<cmd>Neotest run<cr>", desc = "[N]eotest run nearest test" },
		{
			"<leader>Na",
			function()
				local n = require("neotest")
				n.run.run(vim.fn.getcwd(-1, -1)) -- use global working directory
				n.summary.open()
			end,
			desc = "[N]eotest run [a]ll tests",
		},
		{ "<leader>Ns", "<cmd>Neotest summary<cr>", desc = "[N]eotest toggle [s]ummary" },
		{ "<leader>No", "<cmd>Neotest output-panel<cr>", desc = "[N]eotest toggle [o]utput panel" },
	},
	opts = function(_, opts)
		opts.adapters = {
			require("neotest-zig")({
				dap = {
					adapter = "lldb",
				},
			}),
			require("neotest-playwright").adapter({
				options = {
					persist_project_selection = true,
					enable_dynamic_test_discovery = true,
				},
			}),
			require("neotest-golang"),
		}
	end,
}
