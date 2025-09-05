-- https://docs.astronvim.com/recipes/ai/
return {
  "Saghen/blink.cmp",
  optional = true,
  opts = function(_, opts)
    if not opts.keymap then opts.keymap = {} end
    opts.keymap["<Tab>"] = {
      "snippet_forward",
      function()
        if vim.g.ai_accept then return vim.g.ai_accept() end
      end,
      "fallback",
    }
    opts.keymap["<S-Tab>"] = { "snippet_backward", "fallback" }
    opts.cmdline = {
      enabled = true,
      completion = {
        menu = {
          auto_show = true,
        },
      },
    }
  end,
}
