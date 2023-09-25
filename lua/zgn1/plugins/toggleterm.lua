require("toggleterm").setup({
	open_mapping = "<C-g>",
	direction = "float",
	shade_terminals = true,
	close_on_exit = true,
	shell = vim.o.shell,
})
