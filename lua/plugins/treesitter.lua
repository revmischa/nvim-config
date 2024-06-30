-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- all added by mish

    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "json",
      "javascript",
      -- "typescript",
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
    })

    opts.rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    }

    opts.highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }

    opts.indent = {
      enable = true,
    }

    -- opts.autotag = {
    --   enable = true,
    -- }

    opts.auto_install = true
  end,
}
