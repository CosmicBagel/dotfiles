return {
    'stevearc/oil.nvim', -- file browser, like vim vinegar
    opts = {
        keymaps = {
            ["q"] = "actions.close",
        },
        view_options = {
            show_hidden = true,
        },
        float = {
            -- Padding around the floating window
            padding = 2,
            max_width = 155,
            max_height = 40,
            border = "rounded",
        },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function(_, opts)
        require("oil").setup(opts)
        vim.keymap.set(
            "n", "<leader>-", "<CMD>Oil<CR>",
            { desc = "Open parent directory" }
        )
        -- alias for Ex to oil cuz habits
        vim.api.nvim_create_user_command('Ex', 'Oil', {})
    end,
}
