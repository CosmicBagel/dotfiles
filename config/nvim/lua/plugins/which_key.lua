return {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function() -- This is the function that runs, AFTER loading
        require('which-key').setup({
            window = {
                border = 'single'
            }
        })

        -- Document existing key chains
        require('which-key').register {
            ['<leader>b'] = { name = 'De[b]ug', _ = 'which_key_ignore' },
            ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
            ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
            ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
            ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
            ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
            ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
            ['<leader>q'] = { name = '[Q]uack', _ = 'which_key_ignore' },
            ['<leader>x'] = { name = 'Diagnostics (Trouble)', _ = 'which_key_ignore' },
            ['<leader>j'] = { name = 'Split/[j]oin (treesj)', _ = 'which_key_ignore' },
            ['<leader>p'] = { name = 'Buffers', _ = 'which_key_ignore' },
        }
    end,
}
