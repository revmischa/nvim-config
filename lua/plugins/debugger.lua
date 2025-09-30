return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      "jay-babu/mason-nvim-dap.nvim",
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

      -- Mason ensures debugpy is installed
      require("mason-nvim-dap").setup {
        ensure_installed = { "python" },
      }

      -- Example config: ask for AWS_PROFILE
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
      }
    end,
  },
}
