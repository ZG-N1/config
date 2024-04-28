require("toggleterm").setup({
	open_mapping = "<C-g>",
	-- horizontal, float, vertical
	direction = "float",
	-- start_in_insert = true,
	shade_terminals = true,
	close_on_exit = true,
	shell = vim.o.shell,
})
