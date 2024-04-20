return {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    -- See `:help gitsigns` to understand what the configuration keys do
    'lewis6991/gitsigns.nvim',
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            delay = 0,             -- always show blame
        },
        on_attach = function(bufnr)
            local gitsigns = require('gitsigns')

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']c', function()
                if vim.wo.diff then
                    vim.cmd.normal({ ']c', bang = true })
                else
                    gitsigns.nav_hunk('next')
                end
            end, { desc = 'Next Git Hunk' })

            map('n', '[c', function()
                if vim.wo.diff then
                    vim.cmd.normal({ '[c', bang = true })
                else
                    gitsigns.nav_hunk('prev')
                end
            end, { desc = 'Previous Git Hunk' })

            -- Actions
            map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[S]tage Hunk' })
            map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[R]eset Hunk' })
            map('v', '<leader>gs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                { desc = '[S]tage Hunk' })
            map('v', '<leader>gr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                { desc = '[R]eset Hunk' })
            map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[S]tage Buffer' })
            map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = '[U]ndo Stage Hunk' })
            map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[R]eset Buffer' })
            map('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[P]review Hunk' })
            map('n', '<leader>gb', function() gitsigns.blame_line { full = true } end, { desc = '[B]lame Line' })
            map('n', '<leader>gB', gitsigns.toggle_current_line_blame, { desc = 'Toggle [B]lame Line' })
            map('n', '<leader>gd', gitsigns.diffthis, { desc = '[D]iff This' })
            map('n', '<leader>gD', function() gitsigns.diffthis('~') end, { desc = '[D]iff This ~' })
            map('n', '<leader>gx', gitsigns.toggle_deleted, { desc = 'Toggle Deleted' })

            -- Text object
            map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Git [H]unk' })
        end
    }
}
