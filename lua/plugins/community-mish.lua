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
  -- { import = "astrocommunity.git.fugit2-nvim", libgit2_path = "/opt/homebrew/lib/libgit2.dylib" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.neogit" },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  { import = "astrocommunity.git.octo-nvim" },

  { import = "astrocommunity.comment.mini-comment" },
  { import = "astrocommunity.motion.nvim-surround" },

  -- nvchad status line
  -- { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  -- vscode winbar (status line for the top of the window)
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },

  -- VIBE CODING
  { import = "astrocommunity.recipes.ai" },
  {
    import = "astrocommunity.editing-support.mcphub-nvim",
  },
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      auto_approve = true, -- Auto-approve MCP tool calls to avoid confirmation dialogs
      extensions = {
        avante = {
          make_slash_commands = true, -- make /slash commands from MCP server prompts
        },
      },
    },
    config = function(_, opts) require("mcphub").setup(opts) end,
  },
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.completion.avante-nvim" },
  {
    "yetone/avante.nvim",
    opts = {
      instructions_file = "CLAUDE.md",
      provider = "copilot",
      providers = {
        copilot = {
          model = "claude-sonnet-4",
        },
      },
      system_prompt = function()
        local ok, hub = pcall(require, "mcphub")
        if ok then
          local instance = hub.get_hub_instance()
          return instance and instance:get_active_servers_prompt() or ""
        end
        return ""
      end,
      custom_tools = function()
        local ok, mcphub = pcall(require, "mcphub.extensions.avante")
        if ok then return { mcphub.mcp_tool() } end
        return {}
      end,
      disabled_tools = {
        "list_files", -- Built-in file operations (conflicts with MCP filesystem server)
        "search_files",
        "read_file",
        "create_file",
        "rename_file",
        "delete_file",
        "create_dir",
        "rename_dir",
        "delete_dir",
        "bash", -- Built-in terminal access (conflicts with MCP neovim server)
      },

      -- https://github.com/yetone/avante.nvim?tab=readme-ov-file#fast-apply
      behaviour = {
        enable_fastapply = true, -- Enable Fast Apply feature
      },

      -- https://github.com/yetone/avante.nvim?tab=readme-ov-file#acp-configuration
      acp_providers = {
        ["claude-code"] = {
          command = "npx",
          args = { "@zed-industries/claude-code-acp" },
          env = {
            NODE_NO_WARNINGS = "1",
            ANTHROPIC_API_KEY = os.getenv "ANTHROPIC_API_KEY",
          },
        },
      },

      dependencies = {
        {
          -- support for image pasting
          "HakonHarnes/img-clip.nvim",
          event = "VeryLazy",
          opts = {
            -- recommended settings
            default = {
              embed_image_as_base64 = false,
              prompt_for_file_name = false,
              drag_and_drop = {
                insert_mode = true,
              },
              -- required for Windows users
              use_absolute_path = true,
            },
          },
        },
      },
    },
  },
  -- {
  --   import = "yetone/avante.nvim",
  --   opts = {
  --     instructions_file = "CLAUDE.md",
  --     provider = "copilot",
  --     providers = {
  --       copilot = {
  --         model = "copilot/claude-sonnet-4",
  --       },
  --     },
  --   },
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
  -- },

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

  -- python (using ruff pack only to avoid conflicts with black/isort)
  { import = "astrocommunity.pack.python-ruff" },

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

  -- terraform
  { import = "astrocommunity.pack.terraform" },

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
  { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
  { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  { import = "astrocommunity.debugging.telescope-dap-nvim" },
  { import = "astrocommunity.debugging.nvim-dap-view" },

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
