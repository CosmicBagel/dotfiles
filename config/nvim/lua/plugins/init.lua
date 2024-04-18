-- This is where all of the plugins that don't need much config go
return {
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
    "tpope/vim-surround", -- suround motion
    "norcalli/nvim-colorizer.lua", -- hex codes show their color
    {
        -- highlights todos and gives you nice lists
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },
}
