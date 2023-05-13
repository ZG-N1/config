local dap = require("dap")
dap.adapters.python = {
	type = "executable",
	command = "C:/Users/ZGN1/miniconda3/envs/learnpy/python",
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	type = "python",
	request = "launch",
	name = "Launch file",
	program = "${file}",
	pythonPath = function()
		return "C:/Users/ZGN1/miniconda3/envs/learnpy/python"
	end,
}
