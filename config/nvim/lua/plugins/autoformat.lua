return {
	-- Autoformat
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format()
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		notify_no_formatters = true,
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- format_on_save = {
		-- 	-- I recommend these options. See :help conform.format for details.
		-- 	lsp_format = "fallback",
		-- 	timeout_ms = 500,
		-- },
		-- function(bufnr)
		--     -- Disable "format_on_save lsp_fallback" for languages that don't
		--     -- have a well standardized coding style. You can add additional
		--     -- languages here or re-enable it for the disabled ones.
		--     local disable_filetypes = { c = true, cpp = true }
		--     return {
		--         timeout_ms = 500,
		--         lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
		--     }
		-- end,
		formatters_by_ft = {
			-- lua = { 'stylua' },
			-- Conform can also run multiple formatters sequentially
			-- python = { "isort", "black" },
			--
			-- You can use a sub-list to tell conform to run *until* a formatter
			-- is found.
			-- javascript = { { "prettierd", "prettier" } },
			["zig"] = { "zigfmt" },
			["lua"] = { "stylua" },
			["python"] = { "black" },
			["javascript"] = { "prettier" },
			["javascriptreact"] = { "prettier" },
			["typescript"] = { "prettier" },
			["typescriptreact"] = { "prettier" },
			["vue"] = { "prettier" },
			["css"] = { "prettier" },
			["scss"] = { "prettier" },
			["less"] = { "prettier" },
			["html"] = { "prettier" },
			["json"] = { "prettier" },
			["jsonc"] = { "prettier" },
			["yaml"] = { "prettier" },
			["markdown"] = { "prettier" },
			["markdown.mdx"] = { "prettier" },
			["graphql"] = { "prettier" },
			["handlebars"] = { "prettier" },
			["go"] = { "gofumpt" },
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)
		-- disable the format on save from the zig.vim that's bundled with
		-- neovim
		vim.g.zig_fmt_autosave = 0
	end,
}
