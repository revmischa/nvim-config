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
      virtual_text = true,
      underline = true,
    },
    options = {
      opt = {
        relativenumber = false,
        number = true,
        spell = false,
        signcolumn = "auto",
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

        ["<C-s>"] = { "<cmd>update<CR>", desc = "Save File" },
        ["<leader>fy"] = { ":let @+ = expand('%')<cr>", desc = "Copy relative path" },
        ["<leader>fY"] = { ":let @+ = expand('%:p')<cr>", desc = "Copy absolute path" },

        ["<leader>sv"] = { ":vsplit<cr>", desc = "Split vertically" },
        ["<leader>sa"] = { ":split<cr>", desc = "Split horizontally" },
        ["<leader>sq"] = { ":MaximizerToggle!<cr>", desc = "Maximize pane" },
        ["<leader>q"] = { ":q<cr>", desc = "Close window" },

        ["<leader>jd"] = { ":lua vim.lsp.buf.definition()<cr>", desc = "Jump to definition" },
        ["<leader>jj"] = { ":vsplit | lua vim.lsp.buf.definition()<CR>", desc = "Jump to definition in vertical split" },
        ["<leader>jh"] = { ":split | lua vim.lsp.buf.definition()<CR>", desc = "Jump to definition in horizontal split" },

        -- vtsls
        ["<leader>im"] = { ":VtsExec add_missing_imports<cr>", desc = "Add missing imports" },
        ["<leader>io"] = { ":VtsExec organize_imports<cr>", desc = "Organize imports" },
        ["<leader>ir"] = { ":VtsExec remove_unused<cr>", desc = "Remove unused" },
        ["<leader>if"] = { ":VtsExec fix_all<cr>", desc = "Fix all" },

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
        ["<leader>rc"] = { "<cmd>:so ~/.config/nvim/init.lua<cr>", desc = "Reload config" },

        -- neogit
        ["<C-q>"] = { "<cmd>Neogit<CR>", desc = "Git Status" },
        ["<leader>gf"] = { "<cmd>Neogit<CR>", desc = "Git Status" },
        ["<leader>gG"] = { "<cmd>Neogit kind=tab<CR>", desc = "Git Graph" },

        ["<leader>fR"] = { "<cmd>GrugFar<CR>", desc = "Grug Find/Replace" },
        ["<leader>fw"] = { function() Snacks.picker.grep_word() end, desc = "Find word under cursor" },

        -- git-conflict
        ["<leader>k"] = { desc = "Git Conflict" },
        ["<leader>ko"] = { "<cmd>GitConflictChooseOurs<CR>", desc = "Choose ours" },
        ["<leader>kt"] = { "<cmd>GitConflictChooseTheirs<CR>", desc = "Choose theirs" },
        ["<leader>kb"] = { "<cmd>GitConflictChooseBoth<CR>", desc = "Choose both" },
        ["<leader>kn"] = { "<cmd>GitConflictChooseNone<CR>", desc = "Choose none" },
        ["<leader>k]"] = { "<cmd>GitConflictNextConflict<CR>", desc = "Next conflict" },
        ["<leader>k["] = { "<cmd>GitConflictPrevConflict<CR>", desc = "Previous conflict" },
        ["<leader>kq"] = { "<cmd>GitConflictListQf<CR>", desc = "List conflicts in quickfix" },

        -- avante
        ["<leader>ua"] = { "<cmd>AvanteToggle<CR>", desc = "Toggle Avante" },
        ["<M-S-l>"] = { "<cmd>AvanteToggle<CR>", desc = "Toggle Avante" },
        ["<M-l>"] = { "<cmd>AvanteFocus<CR>", desc = "Focus Avante" },

        ["<leader>z"] = { "<cmd>tabclose<CR>", desc = "Close tab" },
        ["<leader>bo"] = { "<cmd>BufOnly<CR>", desc = "Close other buffers" },

        -- debugging
        ["<leader>dn"] = { "<cmd>DapPytestNearest<CR>", desc = "Debug nearest pytest function" },
        ["<leader>dd"] = { "<cmd>DapPytestFile<CR>", desc = "Debug current pytest file" },
      },
      i = {
        -- v6: <C-s> removed from insert mode (now built-in signature help)
        ["<C-f>"] = { "<cmd>ToggleTerm direction=float<cr>" },
        ["<M-/>"] = { "gcc", remap = true, desc = "Toggle comment line" },
        ["<C-n>"] = {
          function() require("copilot.suggestion").next() end,
          desc = "Next Copilot Suggestion",
        },
        ["<M-S-l>"] = { "<cmd>AvanteToggle<CR>", desc = "Toggle Avante" },
      },
      t = {
        ["<C-f>"] = { "<cmd>ToggleTerm direction=float<cr>" },
        ["<M-/>"] = { "gcc", remap = true, desc = "Toggle comment line" },
      },
      v = {
        ["<leader>sl"] = { ":sort<cr>", desc = "Sort lines" },
      },
    },
  },
}
