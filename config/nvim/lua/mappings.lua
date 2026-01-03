-- -- -- mappings -- -- --
-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- more sane movement, important when lines are wrapped
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })

-- make ctrl+backspace work normally
vim.keymap.set("i", "<c-bs>", "<c-w>", { noremap = true, silent = true })

-- escape clears highlights and current message (in normal mode)
-- passes <esc> input on, so that flash.nvim can pick it up
vim.keymap.set("n", "<esc>", ":nohl<cr>:echo<cr><esc>", { noremap = true, silent = true })

-- single character delete goes to void register
vim.keymap.set("n", "x", [["_x]], { noremap = true, silent = true, desc = "Delete character" })
vim.keymap.set("n", "X", [["_X]], { noremap = true, silent = true, desc = "Delete character backwards" })

-- in visual mode, move selected lines up or down with J and K
-- also auto indents as they move
vim.keymap.set("v", "<m-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("v", "<m-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move line up" })

-- move lines in insert mode
vim.keymap.set("i", "<m-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("i", "<m-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true, desc = "Move line up" })

-- move lines in normal mode
vim.keymap.set("n", "<m-j>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("n", "<m-k>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })

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
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Navigate panes more easily
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate pane left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate pane down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate pane up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate pane right" })

-- Move panes more easily
vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move pane left" })
vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move pane down" })
vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move pane up" })
vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move pane right" })

-- Resize panes more easily
vim.keymap.set("n", "<C-Left>", "<C-w><", { desc = "Decrease pane width" })
vim.keymap.set("n", "<C-Right>", "<C-w>>", { desc = "Increase pane width" })
vim.keymap.set("n", "<C-Up>", "<C-w>+", { desc = "Increase pane height" })
vim.keymap.set("n", "<C-Down>", "<C-w>-", { desc = "Decrease pane height" })

-- Space m alias for make
vim.keymap.set("n", "<leader>m", ":wa<CR>:make<CR>", { desc = "Run :make command" })
