return {
  "stevearc/oil.nvim", -- file browser, like vim vinegar
  opts = {
    keymaps = {
      ["?"] = { "actions.show_help", mode = "n" },
      ["q"] = "actions.close",
      ["<C-c>"] = false,
      ["<C-l>"] = false,
      ["<C-h>"] = false,
      ["<C-j>"] = false,
      ["<C-k>"] = false,
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
    -- alias for Ex to oil cuz habits
    vim.api.nvim_create_user_command("Ex", "Oil", {})
  end,
  keys = {
    { "<leader>-", "<CMD>Oil<CR>", mode = "n", desc = "Oil - Open parent directory" },
    { "<leader>_", "<CMD>Oil .<CR>", mode = "n", desc = "Oil - Open current working directory" },
  },
}
