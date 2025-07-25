local function ColorMyPencils(color)
	color = color or "default"
	vim.cmd.colorscheme(color)

	-- force allow transparent bg
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = "#FFFFFF" })
	-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#FFFFFF" })

	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000", fg = "#FFFFFF", blend = 30 })

	-- custom colors for cmp menu
	vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#000000" })

	vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "#000000" })
	vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "none" })

	-- dark cursor line
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "#19181a" })

	-- red color column
	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1e1e1e" })
end

return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				transparent_mode = true,
			})

			-- ColorMyPencils("gruvbox")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				transparent = true,
				theme = "dragon",
			})

			-- ColorMyPencils("kanagawa")
		end,
	},
	-- https://github.com/catppuccin/nvim
	{
		"loctvl842/monokai-pro.nvim",
		priority = 1000,
		config = function()
			require("monokai-pro").setup({
				transparent_background = true,
			})

			-- ColorMyPencils("monokai-pro")
			vim.cmd.colorscheme("monokai-pro")

			-- brighten comments a bit, easier to read
			vim.api.nvim_set_hl(0, "Comment", { fg = "#c1c0c0" })
			vim.api.nvim_set_hl(0, "TSComment", { fg = "#c1c0c0" })
			vim.api.nvim_set_hl(0, "@string.documentation", { fg = "#c1c0c0" })

			-- Delimiters were too dark, looked like NonText
			vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#c1c0c0" })

			-- vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })

			vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#ff6188" })

			vim.api.nvim_set_hl(0, "CursorLineNR", { bg = "#939293", fg = "#221f22" })
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#19181a", underline = true, sp = "#5b595c" })

			-- see guicursor in options.lua to configure mode specific behaviour and shape
			vim.api.nvim_set_hl(0, "lCursor", { bg = "#fcfcfa", fg = "#19181a"})
			vim.api.nvim_set_hl(0, "Cursor", { bg = "#fcfcfa", fg = "#19181a"})
			vim.api.nvim_set_hl(0, "InsertCursor", { bg = "#a9dc76", fg = "#19181a"})
			vim.api.nvim_set_hl(0, "VisualCursor", { bg = "#ab9df2", fg = "#19181a"})
			vim.api.nvim_set_hl(0, "ReplaceCursor", { bg = "#ff6188", fg = "#19181a"})
			vim.api.nvim_set_hl(0, "OperatorPendingCursor", { bg = "#ffd866", fg = "#19181a"})
			vim.api.nvim_set_hl(0, "TermCursor", { bg = "#fcfcfa", fg = "#19181a" })

			-- borders
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#c1c0c0" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = "#c1c0c0" })
			vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none", fg = "#c1c0c0" })

			-- nvim-scrollbar
			vim.api.nvim_set_hl(0, "ScrollbarHandle", { bg = "#939293", fg = "none", blend = 60 })
			vim.api.nvim_set_hl(0, "ScrollbarCursorHandle", { bg = "#fcfcfa", fg = "#fcfcfa" })
			vim.api.nvim_set_hl(0, "FlashBackdrop", { bg = "none", fg = "#ab9df2" })
			vim.api.nvim_set_hl(0, "FlashCurrent", { bg = "#ab9df2", fg = "#221f22" })
			vim.api.nvim_set_hl(0, "FlashLabel", { bg = "none", fg = "#ff6188" })
			vim.api.nvim_set_hl(0, "LightBulbNumber", { bg = "#ffd866", fg = "#221f22" })

			vim.api.nvim_set_hl(0, "Whitespace", { fg = "#5b595c" })
			vim.api.nvim_set_hl(0, "NonText", { bg = "none", fg = "#5b595c" })
			vim.api.nvim_set_hl(0, "IblIndent", { bg = "none", fg = "#939293" })
			vim.api.nvim_set_hl(0, "IblWhitespace", { bg = "none", fg = "#5b595c" })
			vim.api.nvim_set_hl(0, "IblScope", { bg = "none", fg = "#ab9df2" })

			-- debug adapter protocol
			vim.api.nvim_set_hl(0, "DapBreakpoint", { bg = "none", fg = "#ff6188" })
			vim.api.nvim_set_hl(0, "DapBreakpointCondition", { bg = "none", fg = "#ff6188" })
			vim.api.nvim_set_hl(0, "DapLogPoint", { bg = "none", fg = "#ffd866" })
			vim.api.nvim_set_hl(0, "DapBreakpointRejected", { bg = "none", fg = "#ff6188" })

			vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ff6188" })
			vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#ffd866" })
			vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#78dce8" })
			vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#a9dc76" })
			vim.api.nvim_set_hl(0, "DiagnosticTest", { fg = "#ab9df2" })

			-- monokai pro pallet
			--   dark = p.dark2,        -- "#19181a"
			--   black = p.dark1,       -- "#221f22"
			--   red = p.accent1,       -- "#ff6188"
			--   green = p.accent4,     -- "#a9dc76"
			--   yellow = p.accent3,    -- "#ffd866"
			--   blue = p.accent2,      -- "#fc9867"
			--   magenta = p.accent6,   -- "#ab9df2"
			--   cyan = p.accent5,      -- "#78dce8"
			--   white = p.text,        -- "#fcfcfa"
			--   dimmed1 = p.dimmed1,   -- "#c1c0c0"
			--   dimmed2 = p.dimmed2,   -- "#939293"
			--   dimmed3 = p.dimmed3,   -- "#727072"
			--   dimmed4 = p.dimmed4,   -- "#5b595c"
			--   dimmed5 = p.dimmed5,   -- "#403e41"
		end,
	},
	{
		"catppuccin/nvim",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				-- transparent_background = true,
			})

			-- vim.cmd.colorscheme("catppuccin-latte")
		end,
	},
}
