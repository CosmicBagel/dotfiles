return {
    "tamton-aquib/duck.nvim",
    config = function()
        vim.keymap.set("n", "<leader>qq", function()
            require("duck").hatch()
        end, { desc = "Unleash the duck" })
        vim.keymap.set("n", "<leader>qk", function()
            require("duck").cook()
        end, { desc = "Cook the duck" })
    end,
}
