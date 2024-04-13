
-- -- -- basic vim options -- -- --
vim.opt.clipboard = "unnamedplus" -- use system clipboard for default yank
vim.opt.termguicolors = true -- enable proper colors
vim.opt.autowriteall = false -- kind of like auto-save, but I only want it in certain situations
vim.opt.undofile = true -- preserve undo state, needed for undotree

vim.opt.number = true -- show line numbers
vim.cmd("set linebreak") -- don't spilt words when line wrapping
vim.opt.colorcolumn = "80"  -- displays guideline at 80 characters

-- when backspacing, delete indents, end of lines, and starts(?)
vim.opt.backspace = "indent,eol,start"

-- keep 10 lines on screen above and below cursor
vim.opt.scrolloff = 10

-- sensible tab behaviour
vim.opt.expandtab = true -- replace tabs with spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- show the gutter 
vim.opt.signcolumn = 'yes'

-- time (ms) before swap is written to disk (defaults to 4000)
vim.opt.updatetime = 250

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- show offscreen substitions (:s :%s) in a preview pane
vim.opt.inccommand = 'split'

-- display undesireable characters (trailing space, tabs not converted to 
-- spaces, and weird non-breaking spaces)
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- highlight line cursor is currently on
vim.opt.cursorline = true

-- Once a proper status line is installed, might want to remove this
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

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

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- ==== plugin shopping list ==== --
-- lazy.nvim
-- treesitter
-- A COLOR SCHEME FOR THE LOVE OF GOD
-- dressing
-- nvim-tree/nvim-web-devicons
-- some kind of status bar
-- tpope/vim-sleuth -- Detect tabstop and shiftwidth automatically
-- numToStr/Comment.nvim
-- oil.nvim
-- cmp
-- telescope with fzf and telescope-ui-select
-- nvim-lspconfig 
--      mason, mason-lspconfig,mason-tool-installer
-- stevearc/conform.nvim --Autoformat
-- gitsigns
-- jump or sneak
-- https://codeium.com/
-- steal things from this guy! https://youtu.be/V070Zmvx9AM
--      lots of little tricks in here
--  more text objects (https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
-- https://github.com/epwalsh/obsidian.nvim


