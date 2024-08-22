-- -- -- Autocommands -- -- --

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local CosmicBagelGroup = augroup("CosmicBagel", { clear = true })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- strip trailing spaces on each line
-- (will not report an error on no match)
autocmd({ "BufWritePre" }, {
	group = CosmicBagelGroup,
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "oil" then
			return
		end
		vim.api.nvim_command("normal! mz")
		vim.api.nvim_command([[%s/\s\+$//e]])
		vim.api.nvim_command("normal! `z")
	end,
})

-- my translation of
-- autocmd FileType dap-float nnoremap <buffer><silent> q <cmd>close!<CR>
-- makes q and esc close popup/floats
autocmd({ "FileType" }, {
	group = CosmicBagelGroup,
	pattern = "dap-float",
	callback = function()
		vim.keymap.set("n", "q", "<cmd>close!<CR>", { noremap = true, silent = true, buffer = true })
		vim.keymap.set("n", "<esc>", "<cmd>close!<CR>", { noremap = true, silent = true, buffer = true })
	end,
})

-- disable spell checking for windows and things
autocmd({ "FileType" }, {
	group = CosmicBagelGroup,
	pattern = {
		"TelescopePrompt",
		"TelescopeResults",
		"fidget",
		"help",
		"lazy",
		"mason",
		"lspinfo",
		"undotree",
		"terminal",
		"toggleterm",
		"checkhealth",
	},
	callback = function()
		vim.opt_local.spell = false
	end,
})

-- disable spell check for non-modifiable files
autocmd({ "BufEnter", "BufNew" }, {
	group = CosmicBagelGroup,
	callback = function(args)
		if vim.fn.getbufvar(args.buf, "&modifiable") == 1 then
			return
		end
		vim.opt_local.spell = false
	end,
})

-- godot config files
autocmd({ "BufNewFile", "BufRead" }, {
	group = CosmicBagelGroup,
	pattern = { "*.import", "*.godot" },
	command = "setfiletype gdresource",
})

-- relative line numbers in normal mode, but not insert mode
autocmd({ "InsertEnter" }, {
	group = CosmicBagelGroup,
	pattern = "*",
	command = "set norelativenumber",
})

autocmd({ "InsertLeave" }, {
	group = CosmicBagelGroup,
	pattern = "*",
	command = "set relativenumber",
})

-- basic auto-save
autocmd({ "BufDelete", "BufLeave" }, {
	group = CosmicBagelGroup,
	pattern = "*",
	callback = function(args)
		local buf = args.buf
		-- ignore non-modifiable files
		if vim.fn.getbufvar(buf, "&modifiable") == 0 then
			return
		end

		-- don't auto-save oil buffer
		if vim.bo.filetype == "oil" then
			return
		end

		-- don't auto-save if not modified
		if not vim.api.nvim_buf_get_option(buf, "modified") then
			return
		end

		-- don't auto-save if buffer has no name
		local name = vim.api.nvim_buf_get_name(buf)
		if name == nil or string.len(name) == 0 then
			return
		end

		vim.api.nvim_command("silent! write")
	end,
})

-- temporary hack to not stay in insert mode after enter a file with telescope
-- apparently this was fixed, but idk still broken for me
autocmd("WinLeave", {
	callback = function()
		if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
		end
	end,
})
