-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- Easier way to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- toggle comments
-- (remap = true because gcc isn't built in, but comes from vim/_defaults.lua)
vim.keymap.set("i", "<c-/>", "<esc>mzgcc`za", { remap = true, silent = true, desc = "Toggle comment" })
vim.keymap.set("n", "<c-/>", "gcc", { remap = true, silent = true, desc = "Toggle comment line" })
vim.keymap.set("v", "<c-/>", "gc", { remap = true, silent = true, desc = "Toggle comment" })

-- make ctrl+backspace work normally
vim.keymap.set("i", "<c-bs>", "<c-w>", { noremap = true, silent = true })

-- single character delete goes to void register
vim.keymap.set("n", "x", [["_x]], { noremap = true, silent = true, desc = "Delete character" })
vim.keymap.set("n", "X", [["_X]], { noremap = true, silent = true, desc = "Delete character backwards" })

-- Indent / unindent lines in visual mode easily
vim.keymap.set("v", "<Tab>", ">gv", { remap = true, silent = true, desc = "Indent line" })
vim.keymap.set("v", "<S-Tab>", "<gv", { remap = true, silent = true, desc = "Unindent line" })

-- the macro recording key is annoying
vim.keymap.set("n", "q", "<nop>")
