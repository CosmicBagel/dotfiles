local function ColorMyPencils(color)
	color = color or "default"
	vim.cmd.colorscheme(color)

	-- force allow transparent bg
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })

	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000", blend = 30 })

	-- custom colors for cmp menu
	vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#000000" })

	vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "#000000" })
	vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "none" })

	-- dark cursor line
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1e1e1e" })

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
	{
		"loctvl842/monokai-pro.nvim",
		priority = 1000,
		config = function()
			require("monokai-pro").setup({
				transparent_background = true,
			})

			ColorMyPencils("monokai-pro")
		end,
	},
}
