-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- The + register (system clipboard register) behaves the same as
-- unnamed register (yank/put/delete will go to system clipboard)
vim.opt.clipboard = "unnamedplus"

-- don't format on save
vim.g.autoformat = false

-- more intuitive jumping with ctrl-i, ctrl-o
vim.opt.jumpoptions = "stack,view"

vim.opt.termguicolors = true -- enable proper colors

-- highlight groups are specified here, but colors for the highlight groups are set in color_scheme.lua
vim.opt.guicursor = "n-c-sm:Cursor,v:VisualCursor,i-ci-ve:InsertCursor,r-cr:ReplaceCursor,o:OperatorPendingCursor,t:TermCursor"

vim.opt.scrolloff = 2

-- Hide the 'how to disable mouse' menu item in right click menu
vim.cmd.aunmenu([[PopUp.How-to\ disable\ mouse]])

-- sensible search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- sensible spelling
-- vim.opt.spell = false <- set by autocommand for specific file types (eg terminal)
vim.opt.spell = false
vim.opt.spelllang = { "en_ca" }
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

--
-- user commands
-- 

-- common typo when quitting and writing
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("W", "w", {})
