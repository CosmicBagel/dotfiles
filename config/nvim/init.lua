
-- -- -- basic vim options -- -- --
vim.cmd("set linebreak") -- don't spilt words when line wrapping
--vim.opt.showbreak = ">> "  -- show > when a line is split
vim.opt.colorcolumn = "80"  -- displays guideline at 80 characters
vim.opt.autowriteall = true -- kind of like auto-save
vim.opt.number = true -- show line numbers
vim.opt.clipboard = "unnamedplus" -- use system clipboard for default yank
vim.opt.termguicolors = true -- enable proper colors
vim.opt.undofile = true -- preserve undo state, needed for undotree
vim.opt.backspace = "indent,eol,start"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- -- -- mappings -- -- --
-- more sane movement, important when lines are wrapped
--vim.keymap.set('i', '<c-bs>', 'TEST INPUT SUCCESS', {noremap = true, silent = true})
vim.keymap.set('n', 'j', 'gj', {noremap = true, silent = true})
vim.keymap.set('n', 'k', 'gk', {noremap = true, silent = true})
vim.keymap.set('i', '<c-bs>', '<c-w>', {noremap = true, silent = true})

-- escape clears highlights and current message (in normal mode)
vim.keymap.set('n', '<esc>', ':nohl<cr>:echo<cr>', {noremap = true, silent = true})

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
    vim.opt.scrolloff=0
end, {})

vim.cmd.CenterCursorEnable()
