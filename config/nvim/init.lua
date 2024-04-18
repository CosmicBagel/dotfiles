require('options')
require('mappings')

-- ==== config todo ==== --
-- lazy.nvim
-- treesitter
-- A COLOR SCHEME FOR THE LOVE OF GOD
-- nvim-lspconfig 
--      mason, mason-lspconfig,mason-tool-installer
--      note: use autocommand OnAttach for lsp specific keybinds, so when lsp is absent
--      normal vim keybinds will still work
-- cmp

-- telescope with fzf and telescope-ui-select
-- oil.nvim
-- undotree
-- refactoring.nvim
--
-- indent-blankline -- indentation guidelines
--
-- 'nvim-lua/plenary.nvim',
-- dressing
-- nvim-tree/nvim-web-devicons
-- todo-comments.nvim -- highlight todo notes 
-- mini.nvim -- look into the mini plugins
--

-- some kind of status bar
-- tpope/vim-sleuth <- Detect tabstop and shiftwidth automatically
-- that code folding plugin (ufo.nvim I think)
-- numToStr/Comment.nvim

-- stevearc/conform.nvim --Autoformat
-- gitsigns
-- jump or sneak
-- https://codeium.com/

-- steal things from this guy! https://youtu.be/V070Zmvx9AM
--      lots of little tricks in here
--  more text objects (https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
-- https://github.com/epwalsh/obsidian.nvim

-- TODO move this into color scheme config once I have that
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

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
