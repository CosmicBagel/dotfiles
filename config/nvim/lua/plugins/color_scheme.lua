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

			vim.api.nvim_set_hl(0, "CursorLineNR", { bg = "#c1c0c0", fg = "#221f22" })
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#403e41" })
			vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#ff6188" })
			-- vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })

			-- borders
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#c1c0c0" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = "#c1c0c0" })
			vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none", fg = "#c1c0c0" })

			-- nvim-scrollbar
			vim.api.nvim_set_hl(0, "ScrollbarHandle", { bg = "#5b595c" })
			vim.api.nvim_set_hl(0, "ScrollbarCursorHandle", { bg = "#fcfcfa", fg = "#fcfcfa" })

			vim.api.nvim_set_hl(0, "FlashBackdrop", { bg = "none", fg = "#ab9df2" })
			vim.api.nvim_set_hl(0, "FlashLabel", { bg = "none", fg = "#ff6188" })

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
