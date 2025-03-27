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
  -- { import = "astrocommunity.editing-support.telescope-undo-nvim" },

  { import = "astrocommunity.search.grug-far-nvim" },

  -- restore sessions
  { import = "astrocommunity.recipes.auto-session-restore" },

  -- command palette with telescope recipe for LSP
  -- { import = "astrocommunity.recipes.telescope-lsp-mappings" },

  -- window separator
  { import = "astrocommunity.split-and-window.colorful-winsep-nvim" },

  -- key binding helper (which-key is better)
  -- { import = "astrocommunity.keybinding.mini-clue" },

  -- IDE-like breadcrumbs
  -- { import = "astrocommunity.bars-and-lines.dropbar-nvim" },

  -- { import = "astrocommunity.colorscheme.catppuccin" },

  -- git
  { import = "astrocommunity.git.fugit2-nvim" },

  -- nvchad status line
  -- { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  -- vscode winbar (status line for the top of the window)
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },

  -- VIBE CODING
  { import = "astrocommunity.completion.copilot-lua" },
  {
    import = "astrocommunity.completion.avante-nvim",
    -- opts = function(_, _opts)
    --   local prefix = "<Leader>a"
    -- _opts.mappings.ask = prefix .. "<CR>"
    -- _opts.mappings = {
    --
    --   ask = prefix .. "<CR>",
    --   edit = prefix .. "e",
    --   refresh = prefix .. "r",
    --   focus = prefix .. "f",
    --   toggle = {
    --     default = prefix .. "t",
    --     debug = prefix .. "d",
    --     hint = prefix .. "h",
    --     suggestion = prefix .. "s",
    --     repomap = prefix .. "R",
    --   },
    --   diff = {
    --     next = "]c",
    --     prev = "[c",
    --   },
    --   files = {
    --     add_current = prefix .. ".",
    --   },
    -- }
    -- return _opts
    -- end,
    --

    -- ignored for some reason
    -- opts = {
    --   mappings = {
    --     ask = "<Leader>a<CR>",
    --     edit = "<Leader>ae",
    --     refresh = "<Leader>ar",
    --     focus = "<Leader>af",
    --     toggle = {
    --       default = "<Leader>at",
    --       debug = "<Leader>ad",
    --       hint = "<Leader>ah",
    --       suggestion = "<Leader>as",
    --       repomap = "<Leader>aR",
    --     },
    --     diff = {
    --       next = "]c",
    --       prev = "[c",
    --     },
    --     files = {
    --       add_current = "<Leader>a.",
    --     },
    --   },
    -- },
  },

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
  -- { import = "astrocommunity.lsp.ts-error-translator-nvim" },

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

  -- cooler popup/command dialogs (toast and modal dialogs)
  -- { import = "astrocommunity.utility.noice-nvim" },
  -- {
  --   "folke/noice.nvim",
  --   opts = {
  --     lsp = {
  --       signature = {
  --         enabled = false,
  --       },
  --     },
  --   },
  -- },

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
