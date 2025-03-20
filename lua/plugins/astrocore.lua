-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
      -- spacing = 4, -- mish
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        -- ui_notifications_enabled = true, -- notifications when toggling UI elements
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },

        --- mish

        ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },

        -- open files (hidden)
        ["<leader>fv"] = { ':lua require"telescope.builtin".find_files({ hidden = true })<CR>', desc = "Find hidden" },
        -- quick save
        -- ["<C-s>"] = { ":w<cr>", desc = "Save File" },
        ["<C-s>"] = { "<cmd>update<CR>", desc = "Save File" },
        -- clear search highlights
        -- ["<leader>nh"] = { ":nohlsearch<cr>", desc = "Clear search highlights" },
        -- copy relative path of current file to clipboard
        ["<leader>fy"] = { ":let @+ = expand('%:p')<cr>", desc = "Copy relative path" },
        -- split vertically
        ["<leader>sv"] = { ":vsplit<cr>", desc = "Split vertically" },
        -- split horizontally
        ["<leader>sa"] = { ":split<cr>", desc = "Split horizontally" },
        -- maximize current pane
        ["<leader>sq"] = { ":MaximizerToggle!<cr>", desc = "Maximize pane" },
        -- close window
        ["<leader>q"] = { ":q<cr>", desc = "Close window" },
        -- jump to definition
        ["<leader>jd"] = { ":lua vim.lsp.buf.definition()<cr>", desc = "Jump to definition" },
        -- jump to definition in vertical split
        ["<leader>jj"] = {
          '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>',
          desc = "Jump to definition in vertical split",
        },
        -- jump to definition in horizontal split
        ["<leader>jh"] = {
          '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="split"})<CR>',
          desc = "Jump to definition in horizontal split",
        },

        -- vtsls
        -- ["<leader>im"] = { ":TSToolsAddMissingImports<cr>", desc = "Add missing imports" },
        -- ["<leader>io"] = { ":TSToolsOrganizeImports<cr>", desc = "Organize imports" },
        -- ["<leader>ir"] = { ":TSToolsRemoveUnused<cr>", desc = "Remove unused" },

        -- tsserver
        -- TypeScript: add missing imports
        ["<leader>im"] = { ":VtsExec add_missing_imports<cr>", desc = "Add missing imports" },
        -- TypeScript: organize imports
        ["<leader>io"] = { ":VtsExec organize_imports<cr>", desc = "Organize imports" },
        -- TypeScript: remove unused
        ["<leader>ir"] = { ":VtsExec remove_unused<cr>", desc = "Remove unused" },
        -- TypeScript: fix all
        ["<leader>if"] = { ":VtsExec fix_all<cr>", desc = "Fix all" },

        -- restart LSP
        ["<leader>rs"] = { ":LspRestart<cr>", desc = "Restart LSP" },
        -- show LSP references
        ["<F1>"] = { ":LspReferences<cr>", desc = "Show LSP references" },
        -- LSP rename current symbol
        ["<F2>"] = { ":LspRename<cr>", desc = "LSP rename current symbol" },
        -- recent files
        ["<leader><leader>"] = { ":Telescope oldfiles<cr>", desc = "Recent files" },
        -- don't copy deleted chat
        ["x"] = { '"_x' },
        -- open astro when no buffers are open
        ["<leader>c"] = {
          function()
            local bufs = vim.fn.getbufinfo { buflisted = true }
            require("astronvim.utils.buffer").close(0)
            if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then
              require("alpha").start(true)
            end
          end,
          desc = "Close buffer",
        },
        -- toggle terminal
        ["<C-f>"] = { "<cmd>ToggleTerm direction=float<cr>" },
        -- ctl-b - comment
        -- ["<C-b>"] = {
        --
        -- opt-/ - comment
        ["<M-/>"] = { "gcc", remap = true, desc = "Toggle comment line" },

        -- reload config
        ["<leader>rc"] = { "<cmd>:so ~/.config/nvim/init.lua<cr>", desc = "Reload config" },
      },
      -- insert mode
      i = {
        -- save file
        ["<C-s>"] = { "<cmd>update<CR>", desc = "Save File" },
        -- toggle terminal
        ["<C-f>"] = { "<cmd>ToggleTerm direction=float<cr>" },

        -- opt-/ - comment
        ["<M-/>"] = { "gcc", remap = true, desc = "Toggle comment line" },

        -- next copilot suggestion
        ["<C-n>"] = {
          function() require("copilot.suggestion").next() end,
          desc = "Next Copilot Suggestion",
        },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
        -- toggle terminal
        ["<C-f>"] = { "<cmd>ToggleTerm direction=float<cr>" },
        -- opt-/ - comment
        ["<M-/>"] = { "gcc", remap = true, desc = "Toggle comment line" },
      },
    },
  },
}
