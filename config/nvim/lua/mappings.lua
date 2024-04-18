-- -- -- mappings -- -- --
-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- more sane movement, important when lines are wrapped
vim.keymap.set('n', 'j', 'gj', {noremap = true, silent = true})
vim.keymap.set('n', 'k', 'gk', {noremap = true, silent = true})

-- make ctrl+backspace work normally
vim.keymap.set('i', '<c-bs>', '<c-w>', {noremap = true, silent = true})

-- escape clears highlights and current message (in normal mode)
vim.keymap.set('n', '<esc>', ':nohl<cr>:echo<cr>', {noremap = true, silent = true})

-- single character delete goes to void register
vim.keymap.set('n', 'x', [["_x]], {noremap = true, silent = true})

-- in visual mode, move selected lines up or down with J and K
-- also auto indents as they move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {noremap = true, silent = true})
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", {noremap = true, silent = true})

-- nice when reading help docs
-- keep the cursor centered (should rewrite as lua)
vim.api.nvim_create_user_command('CenterCursorEnable',
[[let &scrolloff=(winheight(win_getid())/2)+1 |
execute 'normal zz' |
augroup VCenterCursor |
  au! |
  au BufEnter,WinEnter,WinNew,VimResized,WinResized *
    let &scrolloff=(winheight(win_getid())/2)+1 |
augroup END
]],
{})

vim.api.nvim_create_user_command('CenterCursorDisable',
function()
    vim.api.nvim_clear_autocmds({group = "VCenterCursor"})
    vim.opt.scrolloff=10
end, {})

-- vim.cmd.CenterCursorEnable()
