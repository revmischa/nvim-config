---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    config.sources = {}
    return config
  end,
}
