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
autocmd({ "BufWritePre" }, {
    group = CosmicBagelGroup,
    pattern = "*",
    callback = function()
        vim.api.nvim_command("normal! mz")
        vim.api.nvim_command([[%s/\s\+$//e]])
        vim.api.nvim_command("normal! `z")
    end,
})

-- my translation of
-- autocmd FileType dap-float nnoremap <buffer><silent> q <cmd>close!<CR>
-- makes q and esc close popup/floats
autocmd({ "FileType" }, {
    group = CosmicBagelGroup,
    pattern = "dap-float",
    callback = function()
        vim.keymap.set("n", "q", "<cmd>close!<CR>", { noremap = true, silent = true, buffer = true })
        vim.keymap.set("n", "<esc>", "<cmd>close!<CR>", { noremap = true, silent = true, buffer = true })
    end,
})

-- enable spell checking for text files
local spell_ignore_list = {
    "TelescopePrompt", "TelescopeResults", "fidget", "help", "lazy", "mason",
    "lspinfo", "undotree", "oil"
}
autocmd({ "FileType" }, {
    group = CosmicBagelGroup,
    pattern = { "*" },
    callback = function(event)
        -- vim.print(event) -- use this to check what odd fileTypes are used
        if spell_ignore_list[event.match] == nil then
            return
        end
        vim.opt_local.spell = true
    end
})
