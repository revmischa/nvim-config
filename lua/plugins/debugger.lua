local function load_dotenv()
  local env = {}
  if vim.fn.filereadable ".env" ~= 1 then return env end
  for line in io.lines ".env" do
    if not line:match "^%s*$" and not line:match "^%s*#" then
      local key, value = line:match "^%s*([%w_]+)%s*=%s*(.*)%s*$"
      if key and value then
        value = value:gsub("^\"(.*)\"$", "%1"):gsub("^'(.*)'$", "%1")
        env[key] = value
      end
    end
  end
  return env
end

_G.__nvim_load_dotenv = load_dotenv

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap = require "dap"

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch with .env",
          program = "${file}",
          console = "integratedTerminal",
          justMyCode = true,
          env = load_dotenv,
        },
        {
          type = "python",
          request = "launch",
          name = "Pytest: current file (uv)",
          module = "pytest",
          args = { "${file}" },
          console = "integratedTerminal",
          justMyCode = false,
          env = load_dotenv,
        },
        {
          type = "python",
          request = "launch",
          name = "Pytest: nearest (uv)",
          module = "pytest",
          args = { "${file}::${function}" },
          console = "integratedTerminal",
          justMyCode = false,
          env = load_dotenv,
        },
      }
    end,
  },
}
