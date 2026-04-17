return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap = require "dap"

      local env = {}
      if vim.fn.filereadable ".env" == 1 then
        for line in io.lines ".env" do
          local key, value = line:match "^([^=]+)=(.*)$"
          if key and value then env[key] = value end
        end
      end

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch with AWS profile",
          program = "${file}",
          console = "integratedTerminal",
          justMyCode = true,
          env = env,
        },
        {
          type = "python",
          request = "launch",
          name = "Pytest: current file (uv)",
          module = "pytest",
          args = { "${file}" },
          console = "integratedTerminal",
          justMyCode = false,
        },
        {
          type = "python",
          request = "launch",
          name = "Pytest: nearest (uv)",
          module = "pytest",
          args = { "${file}::${function}" },
          console = "integratedTerminal",
          justMyCode = false,
        },
      }
    end,
  },
}
