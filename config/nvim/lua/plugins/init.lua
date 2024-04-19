-- This is where all of the plugins that don't need much config go
return {
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
    "tpope/vim-surround", -- suround motion
    "HiPhish/rainbow-delimiters.nvim", -- rainbow brackets
    {
        -- hex codes show their color #ff0000 #00ff00 #0000ff
        "norcalli/nvim-colorizer.lua",
        opts = { "*"; } -- highlight all files by default (may want to restrict this)
    },
    {
        -- highlights todos and gives you nice lists
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },
}
