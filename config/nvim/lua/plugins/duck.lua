return {
  "tamton-aquib/duck.nvim",
  keys = {
    {
      "<leader>qq",
      function()
        require("duck").hatch()
      end,
      desc = "Unleash the duck",
    },
    {
      "<leader>qk",
      function()
        require("duck").cook()
      end,
      desc = "Cook the duck",
    },
  },
}
