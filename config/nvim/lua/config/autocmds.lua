-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local CosmicBagelGroup = augroup("CosmicBagel", { clear = true })

-- basic auto-save
autocmd({ "BufDelete", "BufLeave", "TextChanged", "InsertLeave" }, {
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
		if not vim.api.nvim_get_option_value("modified", { buf = buf }) then
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
