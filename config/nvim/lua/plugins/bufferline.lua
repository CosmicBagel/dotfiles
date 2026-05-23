return {
  "akinsho/bufferline.nvim",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
    {
      mode = { "n", "x", "i", "v" },
      "<c-1>",
      function()
        require("bufferline").go_to(1, true)
      end,
      desc = "Jump to buffer 1",
    },
    {
      mode = { "n", "x", "i", "v" },
      "<c-2>",
      function()
        require("bufferline").go_to(2, true)
      end,
      desc = "Jump to buffer 2",
    },
    {
      mode = { "n", "x", "i", "v" },
      "<c-3>",
      function()
        require("bufferline").go_to(3, true)
      end,
      desc = "Jump to buffer 3",
    },
    {
      mode = { "n", "x", "i", "v" },
      "<c-4>",
      function()
        require("bufferline").go_to(4, true)
      end,
      desc = "Jump to buffer 4",
    },
    {
      mode = { "n", "x", "i", "v" },
      "<c-5>",
      function()
        require("bufferline").go_to(5, true)
      end,
      desc = "Jump to buffer 5",
    },
    {
      mode = { "n", "x", "i", "v" },
      "<c-6>",
      function()
        require("bufferline").go_to(6, true)
      end,
      desc = "Jump to buffer 6",
    },
    {
      mode = { "n", "x", "i", "v" },
      "<c-7>",
      function()
        require("bufferline").go_to(7, true)
      end,
      desc = "Jump to buffer 7",
    },
    {
      mode = { "n", "x", "i", "v" },
      "<c-8>",
      function()
        require("bufferline").go_to(8, true)
      end,
      desc = "Jump to buffer 8",
    },
    {
      mode = { "n", "x", "i", "v" },
      "<c-9>",
      function()
        require("bufferline").go_to(9, true)
      end,
      desc = "Jump to buffer 9",
    },
    {
      mode = { "n", "x", "i", "v" },
      "<c-0>",
      function()
        require("bufferline").go_to(10, true)
      end,
      desc = "Jump to buffer 10",
    },
  },
  opts = {
    options = {
      -- numbers = "ordinal",
      always_show_bufferline = true,
      -- auto_toggle_bufferline = false,
    },
  },
}
