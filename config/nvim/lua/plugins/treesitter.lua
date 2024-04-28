return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "vimdoc", "vim", "lua", "luadoc", "c", "cpp",
            "rust", "c_sharp", "html", "css", "javascript", "typescript",
            "markdown", "markdown_inline", "go", "bash", "json", "gitignore",
            "git_config", "toml", "yaml", "zig", "sql", "regex", "tsx", "ini",
            "gdscript", "gdshader", "godot_resource"
        },

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don"t have `tree-sitter` CLI
        -- installed locally
        auto_install = true,

        indent = {
            enable = true,
        },

        highlight = {
            enable = true,

            -- Setting this to true will run `:h syntax` and tree-sitter at the
            -- same time. Set this to `true` if you depend on "syntax" being
            -- enabled (like for indentation). Using this option may slow down
            -- your editor, and you may see some duplicate highlights. Instead
            -- of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
            -- markdown and ruby may work better with vim highlighting enabled
        },
    },
    config = function(_, opts)
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

        -- Prefer git instead of curl in order to improve connectivity in some environments
        require('nvim-treesitter.install').prefer_git = true
        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup(opts)

        -- There are additional nvim-treesitter modules that you can use to interact
        -- with nvim-treesitter. You should go explore a few and see what interests you:
        --
        --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
        --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end
}
