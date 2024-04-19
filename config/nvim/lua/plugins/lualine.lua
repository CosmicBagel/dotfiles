return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            theme = "codedark",
            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' }
        },
        extensions = {
            'lazy', 'mason', 'nvim-dap-ui', 'oil', 'quickfix', 'trouble'
        }
    }
}
