return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.pack.lua" },

  { import = "astrocommunity.editing-support.refactoring-nvim" },
  { "ThePrimeagen/refactoring.nvim", dependencies = { "lewis6991/async.nvim" } },
  { import = "astrocommunity.editing-support.nvim-regexplainer" },
  -- errors
  -- { import = "astrocommunity.editing-support.multicursors-nvim" },
  { import = "astrocommunity.editing-support.text-case-nvim" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  -- { import = "astrocommunity.editing-support.telescope-undo-nvim" },

  { import = "astrocommunity.search.grug-far-nvim" },
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      { "<leader>fR", "<cmd>GrugFar<cr>", desc = "Grug Find/Replace" },
    },
  },

  -- restore sessions
  { import = "astrocommunity.recipes.auto-session-restore" },

  -- command palette with telescope recipe for LSP
  -- { import = "astrocommunity.recipes.telescope-lsp-mappings" },

  -- window separator
  -- { import = "astrocommunity.split-and-window.colorful-winsep-nvim" },

  -- key binding helper (which-key is better)
  -- { import = "astrocommunity.keybinding.mini-clue" },

  -- IDE-like breadcrumbs
  -- { import = "astrocommunity.bars-and-lines.dropbar-nvim" },

  -- { import = "astrocommunity.colorscheme.catppuccin" },

  -- git
  -- { import = "astrocommunity.git.fugit2-nvim", libgit2_path = "/opt/homebrew/lib/libgit2.dylib" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.neogit" },
  {
    "NeogitOrg/neogit",
    keys = {
      { "<C-q>", "<cmd>Neogit<cr>", desc = "Git Status" },
      { "<leader>gf", "<cmd>Neogit<cr>", desc = "Git Status" },
      { "<leader>gG", "<cmd>Neogit kind=tab<cr>", desc = "Git Graph" },
    },
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
    keys = {
      { "<leader>k", desc = "Git Conflict" },
      { "<leader>ko", "<cmd>GitConflictChooseOurs<cr>", desc = "Choose ours" },
      { "<leader>kt", "<cmd>GitConflictChooseTheirs<cr>", desc = "Choose theirs" },
      { "<leader>kb", "<cmd>GitConflictChooseBoth<cr>", desc = "Choose both" },
      { "<leader>kn", "<cmd>GitConflictChooseNone<cr>", desc = "Choose none" },
      { "<leader>k]", "<cmd>GitConflictNextConflict<cr>", desc = "Next conflict" },
      { "<leader>k[", "<cmd>GitConflictPrevConflict<cr>", desc = "Previous conflict" },
      { "<leader>kq", "<cmd>GitConflictListQf<cr>", desc = "List conflicts in quickfix" },
    },
  },
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
  { import = "astrocommunity.ai.avante-nvim" },
  {
    "yetone/avante.nvim",
    version = false, -- set this if you want to always pull the latest change
    keys = {
      { "<leader>ua", "<cmd>AvanteToggle<cr>", desc = "Toggle Avante" },
      { "<M-S-l>", "<cmd>AvanteToggle<cr>", mode = { "n", "i" }, desc = "Toggle Avante" },
      { "<M-l>", "<cmd>AvanteFocus<cr>", desc = "Focus Avante" },
    },
    opts = {
      instructions_file = "CLAUDE.md",
      -- auto_suggestions_provider = "claude",
      auto_suggestions_provider = "copilot",
      provider = "copilot",
      -- provider = "claude",
      providers = {
        copilot = {
          model = "gpt-5.1-codex",
        },
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-sonnet-4-5-20250929",
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
        auto_suggestions = true,
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
  { import = "astrocommunity.pack.python.ruff" },
  { import = "astrocommunity.pack.python.basedpyright" },

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
  -- { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },

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
  -- telescope-dap removed in v5 (telescope replaced by snacks picker)
  -- { import = "astrocommunity.debugging.nvim-dap-view" },

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
      auto_open = false,
      auto_close = true,
      auto_preview = false,
      auto_fold = false,
      height = 4,
      use_lsp_diagnostic_signs = true,
      position = "bottom",
    },
  },
}
