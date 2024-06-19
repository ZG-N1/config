local dap = require("dap")
local keymap = vim.keymap

keymap.set("n", "<F5>", dap.continue)
keymap.set("n", "<F10>", dap.step_over)
keymap.set("n", "<F11>", dap.step_into)
keymap.set("n", "<F12>", dap.step_out)
keymap.set("n", "<leader>b", dap.toggle_breakpoint)
keymap.set("n", "<leader>B", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
