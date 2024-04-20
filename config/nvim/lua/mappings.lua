-- -- -- mappings -- -- --
-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- more sane movement, important when lines are wrapped
vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })

-- make ctrl+backspace work normally
vim.keymap.set('i', '<c-bs>', '<c-w>', { noremap = true, silent = true })

-- escape clears highlights and current message (in normal mode)
vim.keymap.set('n', '<esc>', ':nohl<cr>:echo<cr>', { noremap = true, silent = true })

-- single character delete goes to void register
vim.keymap.set('n', 'x', [["_x]], { noremap = true, silent = true, desc = "Delete character" })
vim.keymap.set('n', 'X', [["_X]], { noremap = true, silent = true, desc = "Delete character backwards" })

-- in visual mode, move selected lines up or down with J and K
-- also auto indents as they move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { noremap = true, silent = true })

-- the macro recording key is annoying
vim.keymap.set("n", "q", "<nop>")

-- toggle comments
-- (remap = true because gcc isn't built in, but comes from vim/_defaults.lua)
vim.keymap.set("i", "<C-/>", "<esc>mzgcc`za", { remap = true, silent = true, desc = "Toggle comment" })
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, silent = true, desc = "Toggle comment line" })
vim.keymap.set("v", "<C-/>", "gc", { remap = true, silent = true, desc = "Toggle comment" })

-- paste over visual selection, without changing main register
-- normally pasting over a visual selection swaps the contents
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Put w/o changing reg" })

-- Easier way to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
