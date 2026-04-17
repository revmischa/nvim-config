return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".DS_Store",
          "thumbs.db",
          "node_modules",
        },
      },
    },
  },
}
