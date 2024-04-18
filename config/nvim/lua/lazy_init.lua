local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- initalize lazy, will load each file in the plugins folder init.lua is
-- optional, lazy will go through each file in plugins even if its not pulled
-- in with `require`
require("lazy").setup("plugins", {
    change_detection = { notify = false },
    ui = {
        border = "rounded",
        icons = {
            -- cmd = '⌘',
            -- config = '🛠',
            -- event = '📅',
            -- ft = '📂',
            -- init = '⚙',
            -- keys = '🗝',
            plugin = '🔌',
            -- runtime = '💻',
            -- require = '🌙',
            --source = '📄',
            -- start = '🚀',
            -- task = '📌',
            lazy = '💤 ',
        },
    }
})
