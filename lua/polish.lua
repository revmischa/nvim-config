-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- -- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }
vim.api.nvim_create_user_command(
  "DapPytestFile",
  function()
    require("dap").run {
      type = "python",
      request = "launch",
      name = "Pytest (uv): current file",
      module = "pytest",
      args = { vim.fn.expand "%" },
      console = "integratedTerminal",
      justMyCode = false,
    }
  end,
  {}
)

vim.api.nvim_create_user_command(
  "DapPytestNearest",
  function()
    local function get_nearest_test()
      local ts_utils = require "nvim-treesitter.ts_utils"
      local node = ts_utils.get_node_at_cursor()

      while node do
        if node:type() == "function_definition" then
          local name_node = node:field("name")[1]
          if name_node then
            local func_name = vim.treesitter.get_node_text(name_node, 0)
            if func_name:match("^test_") or func_name:match("^Test") then
              return func_name
            end
          end
        end
        node = node:parent()
      end

      return vim.fn.expand "<cword>"
    end

    require("dap").run {
      type = "python",
      request = "launch",
      name = "Pytest (uv): nearest",
      module = "pytest",
      args = { vim.fn.expand "%" .. "::" .. get_nearest_test() },
      console = "integratedTerminal",
      justMyCode = false,
    }
  end,
  {}
)
