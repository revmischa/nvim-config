--- @type LazySpec
return {
  { "m-demare/hlargs.nvim", event = "BufReadPost" },
  "mg979/vim-visual-multi",

  {
    "sotte/presenting.nvim",
    opts = {
      -- fill in your options here
      -- see :help Presenting.config
      options = {
        width = 100,
      },
    },
    cmd = { "Presenting" },
  },

  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
}
