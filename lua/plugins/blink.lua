return { -- override blink.cmp plugin
  "Saghen/blink.cmp",
  opts = {
    keymap = {
      ["<Tab>"] = { "snippet_forward", "fallback" },
    },
    cmdline = {
      enabled = true,
      completion = {
        menu = {
          auto_show = true,
        },
      },
    },
  },
}
