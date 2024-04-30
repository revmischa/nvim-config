local troublePrefix = "<leader>x"

return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },
  -- { "numtostr/BufOnly.nvim",        cmd = "BufOnly" },
  -- "m-demare/hlargs.nvim",
  -- "mg979/vim-visual-multi",
  -- "onsails/lspkind.nvim",
  -- "bluz71/vim-nightfly-guicolors",
  -- -- "nvim-tree/nvim-web-devicons",
  -- "nvim-lualine/lualine.nvim",
  -- { "nvim-treesitter/playground",   cmd = "TSHighlightCapturesUnderCursor", dependencies = { "nvim-treesitter" } },
  -- { "lvimuser/lsp-inlayhints.nvim", config = true },
  --
  -- {
  --   "folke/trouble.nvim",
  --   cmd = { "TroubleToggle", "Trouble" },
  --   keys = {
  --     { troublePrefix,        desc = "Trouble" },
  --     {
  --       troublePrefix .. "X",
  --       "<cmd>TroubleToggle workspace_diagnostics<cr>",
  --       desc = "Workspace Diagnostics (Trouble)",
  --     },
  --     { troublePrefix .. "x", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
  --     { troublePrefix .. "l", "<cmd>TroubleToggle loclist<cr>",              desc = "Location List (Trouble)" },
  --     { troublePrefix .. "q", "<cmd>TroubleToggle quickfix<cr>",             desc = "Quickfix List (Trouble)" },
  --   },
  --   opts = {
  --     use_diagnostic_signs = true,
  --     position = "bottom",
  --     height = 4,
  --     auto_open = true,
  --     action_keys = {
  --       close = { "q", "<esc>" },
  --       cancel = "<c-e>",
  --     },
  --   },
  -- },

  -- abolish
  -- { "tpope/vim-abolish" },
}
