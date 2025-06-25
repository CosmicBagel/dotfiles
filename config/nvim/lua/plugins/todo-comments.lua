return {
	-- highlights todos and gives you nice lists
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		keywords = {
			FIX = {
				icon = " ", -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "fix", "fixme", "bug", "fixit", "issue" }, -- a set of other keywords that all map to this FIX keywords
				-- signs = false, -- configure signs for some keywords individually
			},
			TODO = { icon = " ", color = "info", alt = { "todo" } },
			HACK = { icon = " ", color = "warning", alt = { "hack" } },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "warn", "warning", "xxx" } },
			PERF = {
				icon = " ",
				color = "hint",
				alt = {
					"OPTIM",
					"PERFORMANCE",
					"OPTIMIZE",
					"OPTIMIZATION",
					"perf",
					"optim",
					"performance",
					"optimize",
					"optimization",
				},
			},
			NOTE = { icon = " ", color = "hint", alt = { "INFO", "HINT", "hint", "note", "info" } },
			TEST = {
				icon = "⏲ ",
				color = "test",
				alt = { "TESTING", "PASSED", "FAILED", "test", "testing", "passed", "failed" },
			},
		},
		colors = {
			error = { "DiagnosticError", "ErrorMsg", "#DC2626" }, -- fix (aka bug)
			warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" }, -- hack, warn
			info = { "DiagnosticInfo", "#2563EB" }, -- todo
			hint = { "DiagnosticHint", "#10B981" }, -- perf, note
			test = { "DiagnosticTest", "#FF00FF" }, -- test
			-- default = { "Identifier", "#7C3AED" },
		},
	},
}
