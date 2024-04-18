-- -- -- Autocommands -- -- --

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local CosmicBagelGroup = augroup('CosmicBagel', { clear = true })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- strip trailing spaces on each line
-- (will not report an error on no match)
autocmd({"BufWritePre"}, {
    group = CosmicBagelGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
