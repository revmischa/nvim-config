return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    filetypes = {
      ["*"] = true,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      help = false,
      TelescopePrompt = false,
      ["snacks_picker_input"] = false,
      ["snacks_input"] = false,
      ["dap-repl"] = false,
    },
    suggestion = {
      keymap = {
        accept = false, -- handled by completion engine
      },
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            -- set the ai_accept function
            ai_accept = function()
              if require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").accept()
                return true
              end
            end,
          },
        },
      },
    },
  },
}
