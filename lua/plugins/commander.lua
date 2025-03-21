return {
  "FeiyouG/commander.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = {
    -- add commands here to your palette
    { "<leader><leader>", "<CMD>Telescope oldfiles<CR>", mode = "n", desc = "Recent files" },
    { "<leader>ar", "<cmd>AstroReload<cr>", mode = "n", desc = "Reload Astro" },
    { "<leader>im", ":VtsExec add_missing_imports<cr>", desc = "Add missing imports" },
    { "<leader>io", ":VtsExec organize_imports<cr>", desc = "Organize imports" },
  },
  config = function()
    require("commander").setup {
      components = {
        "DESC",
        "KEYS",
        "CAT",
      },
      sort_by = {
        "DESC",
        "KEYS",
        "CAT",
        "CMD",
      },
      prompt_title = "HYPHY COMMAND",
      integration = {
        telescope = {
          enable = true,
        },
        lazy = {
          enable = true,
          set_plugin_name_as_cat = true,
        },
      },
    }
  end,
}
