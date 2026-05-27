---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 2000, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics_mode = 3,
      highlighturl = true,
      notifications = true,
    },
    diagnostics = {
      virtual_text = false,
      virtual_lines = { current_line = true },
      underline = true,
    },
    options = {
      opt = {
        relativenumber = false,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
      },
    },
    -- v6: treesitter config moved here from nvim-treesitter plugin spec
    treesitter = {
      ensure_installed = {
        "json",
        "javascript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "rust",
        "toml",
      },
      highlight = true,
      indent = true,
      auto_install = true,
    },
    mappings = {
      n = {
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        ["<Leader>b"] = { desc = "Buffers" },
        ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },

        ["<C-s>"] = { "<cmd>update<cr>", desc = "Save File" },
        ["<leader>fy"] = { "<cmd>let @+ = expand('%')<cr>", desc = "Copy relative path" },
        ["<leader>fY"] = { "<cmd>let @+ = expand('%:p')<cr>", desc = "Copy absolute path" },

        ["<leader>sv"] = { "<cmd>vsplit<cr>", desc = "Split vertically" },
        ["<leader>sa"] = { "<cmd>split<cr>", desc = "Split horizontally" },
        ["<leader>sQ"] = { "<cmd>MaximizerToggle!<cr>", desc = "Maximize pane" },
        ["<leader>q"] = { "<cmd>q<cr>", desc = "Close window" },

        ["<leader>jd"] = { function() vim.lsp.buf.definition() end, desc = "Jump to definition" },
        ["<leader>jj"] = { "<cmd>vsplit<cr><cmd>lua vim.lsp.buf.definition()<cr>", desc = "Jump to definition in vertical split" },
        ["<leader>jh"] = { "<cmd>split<cr><cmd>lua vim.lsp.buf.definition()<cr>", desc = "Jump to definition in horizontal split" },

        -- vtsls
        ["<leader>im"] = { "<cmd>VtsExec add_missing_imports<cr>", desc = "Add missing imports" },
        ["<leader>io"] = { "<cmd>VtsExec organize_imports<cr>", desc = "Organize imports" },
        ["<leader>ir"] = { "<cmd>VtsExec remove_unused<cr>", desc = "Remove unused" },
        ["<leader>if"] = { "<cmd>VtsExec fix_all<cr>", desc = "Fix all" },

        -- v6: :LspRestart removed, use :lsp restart
        ["<leader>rs"] = { function() vim.cmd("lsp restart *") end, desc = "Restart LSP" },
        ["<F1>"] = { function() Snacks.picker.lsp_references() end, desc = "Show LSP references" },
        ["<F2>"] = { function() vim.lsp.buf.rename() end, desc = "LSP rename" },
        ["<leader><leader>"] = { function() Snacks.picker.recent() end, desc = "Recent files" },
        ["x"] = { '"_x' },

        ["<Leader>c"] = {
          function()
            local bufs = vim.fn.getbufinfo { buflisted = true }
            require("astrocore.buffer").close(0)
            if not bufs[2] then require("snacks").dashboard() end
          end,
          desc = "Close buffer",
        },

        ["<C-f>"] = { "<cmd>ToggleTerm direction=float<cr>" },
        ["<M-/>"] = { "gcc", remap = true, desc = "Toggle comment line" },
        ["<leader>rc"] = { "<cmd>Lazy reload all<cr>", desc = "Reload plugins (full restart preferred)" },

        -- octo: feed <leader>Op (Octo → Pull Requests submenu)
        ["<C-p>"] = { "<Leader>Op", remap = true, desc = "Octo Pull Requests" },

        ["<leader>z"] = { "<cmd>tabclose<cr>", desc = "Close tab" },

        -- debugging
        ["<leader>dn"] = { "<cmd>DapPytestNearest<cr>", desc = "Debug nearest pytest function" },
        ["<leader>dd"] = { "<cmd>DapPytestFile<cr>", desc = "Debug current pytest file" },
      },
      i = {
        -- v6: <C-s> removed from insert mode (now built-in signature help)
        ["<C-f>"] = { "<cmd>ToggleTerm direction=float<cr>" },
        ["<M-/>"] = { "gcc", remap = true, desc = "Toggle comment line" },
        ["<C-n>"] = {
          function() require("copilot.suggestion").next() end,
          desc = "Next Copilot Suggestion",
        },
      },
      t = {
        ["<C-f>"] = { "<cmd>ToggleTerm direction=float<cr>" },
        ["<M-/>"] = { "gcc", remap = true, desc = "Toggle comment line" },
      },
      v = {
        ["<leader>sl"] = { "<cmd>sort<cr>", desc = "Sort lines" },
      },
    },
  },
}
