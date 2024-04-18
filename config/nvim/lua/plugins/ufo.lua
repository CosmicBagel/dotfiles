return {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
        vim.o.foldcolumn = "0" -- '0' is not bad
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
        -- vim.o.foldmethod = "indent"

        require("ufo").setup {
            provider_selector = function(bufnr, filetype, buftype)
                return { "lsp", "indent" }
            end,
        }
    end,
}
