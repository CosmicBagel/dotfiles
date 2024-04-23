return {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    config = function()
        require('barbar').setup({
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            animation = false,
            -- insert_at_start = true,
            -- …etc.
            icons = {
                buffer_index = true,
                buffer_number = false,
                diagnostics = { { enabled = true }, { enabled = true } },
                modified = { button = '●' },
                pinned = { button = '', filename = true },
            },
        })

        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        -- Move to previous/next
        map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
        map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
        -- Re-order to previous/next
        map('n', '<A-h>', '<Cmd>BufferMovePrevious<CR>', opts)
        map('n', '<A-l>', '<Cmd>BufferMoveNext<CR>', opts)
        -- Goto buffer in position...
        map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
        map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
        map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
        map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
        map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
        map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
        map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
        map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
        map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
        map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

        -- Pin/unpin buffer
        map('n', '<Leader>p', '<Cmd>BufferPin<CR>', opts)
    end
}
