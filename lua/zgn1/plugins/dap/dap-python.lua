local M = {}
function M.setup(_)
	require("dap-python").setup("python", {})
end
return M


local dap = require("dap")
dap.adapters.python = {
  {
  type = "executable",
  command = os.getenv("HOME") .. "~/miniconda3/python",
  args = { "-m", "debugpy.adapter" },
  },
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return "~/miniconda3/python"
    end,
  },
}
