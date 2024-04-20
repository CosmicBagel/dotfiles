return {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
        require('treesj').setup({
            use_default_keymaps = false,
            cursor_behavior = "hold",
            max_join_length = 1024,
        })

        vim.keymap.set('n', '<leader>jm', require('treesj').toggle,
            { desc = "Toggle split/join" })

        vim.keymap.set('n', '<leader>jM', function()
                require('treesj').toggle({ split = { recursive = true } })
            end,
            { desc = "Toggle split/join (recursive)" })

        vim.keymap.set('n', '<leader>j,', require('treesj').split,
            { desc = "Split" })

        vim.keymap.set('n', '<leader>j<', function()
                require('treesj').split({ split = { recursive = true } })
            end,
            { desc = "Split (recursive)" })

        vim.keymap.set('n', '<leader>jj', require('treesj').join,
            { desc = 'Join' })

        vim.keymap.set('n', '<leader>jJ',
            function()
                require('treesj').join({ split = { recursive = true } })
            end,
            { desc = 'Join (recursive)' })
    end
}
