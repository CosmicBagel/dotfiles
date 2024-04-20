return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        direction = 'horizontal',
        size = function(term)
            if term.direction == "horizontal" then
                return vim.o.lines * 0.33
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.45
            end
        end,
    },
    config = function(_, opts)
        require("toggleterm").setup(opts)
        vim.keymap.set({"n", "t", "i", "v", "x", "o"}, [[<c-\>]], "<cmd>ToggleTerm direction=vertical<cr>", { noremap = true, silent = true })
        vim.keymap.set({"n", "t", "i", "v", "x", "o"}, [[<c-`>]], "<cmd>ToggleTerm direction=horizontal<cr>", { noremap = true, silent = true })
    end
}
