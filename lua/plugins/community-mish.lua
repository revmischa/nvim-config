return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.editing-support.refactoring-nvim" },
  { import = "astrocommunity.editing-support.nvim-regexplainer" },
  -- errors
  -- { import = "astrocommunity.editing-support.multicursors-nvim" },
  { import = "astrocommunity.editing-support.text-case-nvim" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.telescope-undo-nvim" },

  -- { import = "astrocommunity.colorscheme.catppuccin" },

  { import = "astrocommunity.completion.copilot-lua-cmp" },

  -- {
  --   import = "astrocommunity.completion.copilot-lua-cmp",
  --   config = function(plugin, opts)
  --     opts = function(_, _opts)
  --       opts_.filetypes.yaml = true
  --       return opts_
  --     end
  --     return opts
  --   end
  --   --   -- opts = {
  --   --   --   filetypes = {
  --   --   --     yaml = true,
  --   --   --     markdown = true,
  --   --   --     ["."] = true,
  --   --   --   }
  --   --   -- }
  -- },

  { import = "astrocommunity.git.octo-nvim" },
  { import = "astrocommunity.comment.mini-comment" },
  { import = "astrocommunity.motion.nvim-surround" },

  -- typescript
  { import = "astrocommunity.pack.typescript" },

  -- rust pack
  { import = "astrocommunity.pack.rust" },

  -- lua pack
  -- { import = "astrocommunity.pack.lua" },

  -- tailwindcss
  { import = "astrocommunity.pack.tailwindcss" },

  -- nix
  -- { import = "astrocommunity.pack.nix" },

  -- prisma
  { import = "astrocommunity.pack.prisma" },

  -- cpp
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.cmake" },

  -- python
  { import = "astrocommunity.pack.python" },

  -- toml
  { import = "astrocommunity.pack.toml" },

  -- json
  { import = "astrocommunity.pack.json" },

  -- yaml
  { import = "astrocommunity.pack.yaml" },

  -- bash
  { import = "astrocommunity.pack.bash" },

  -- markdown
  { import = "astrocommunity.pack.markdown" },

  -- cooler popup/command dialogs
  { import = "astrocommunity.utility.noice-nvim" },
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        signature = {
          enabled = false,
        },
      },
    },
  },

  -- debugging
  -- { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
  -- { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
  -- { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  -- { import = "astrocommunity.debugging.telescope-dap-nvim" },

  -- trouble
  {
    import = "astrocommunity.diagnostics.trouble-nvim",
    -- config = function(plugin, opts)
    --  opts = function(_, opts_)
    --   opts_.auto_open = true
    --   opts_.auto_close = true
    --   opts_.auto_preview = false
    --   opts_.auto_fold = false
    --   opts_.height = 4
    --   opts_.use_lsp_diagnostic_signs = true
    --   opts_.position = "bottom"
    --   return opts_
    --  end
    --  require "plugins.configs.trouble" (plugin, opts)
    -- end
    opts = {
      auto_open = true,
      auto_close = true,
      auto_preview = false,
      auto_fold = false,
      height = 4,
      use_lsp_diagnostic_signs = true,
      position = "bottom",
    },
  },
}
