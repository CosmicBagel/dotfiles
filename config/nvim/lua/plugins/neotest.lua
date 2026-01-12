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
