return {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
        local neocodeium = require("neocodeium")
        neocodeium.setup({
            silent = true,
        })

        vim.keymap.set("i", "<A-c>", neocodeium.clear, { desc = "Codeium clear" })
        vim.keymap.set("i", "<A-f>", neocodeium.accept, { desc = "Codeium accept" })
        vim.keymap.set("i", "<A-w>", neocodeium.accept_word, { desc = "Codeium accept word" })
        vim.keymap.set("i", "<A-a>", neocodeium.accept_line, { desc = "Codeium accept line" })
        vim.keymap.set("i", "<A-e>", neocodeium.cycle_or_complete, { desc = "Codeium cycle forward" })
        vim.keymap.set("i", "<A-r>", function()
            neocodeium.cycle_or_complete(-1)
        end, { desc = "Codeium cycle backward" })
    end,
}
