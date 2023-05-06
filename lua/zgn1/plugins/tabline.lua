-- import tabline plugin safely
local status, tabline = pcall(require, "tabline")
if not status then
	return
end

tabline.setup({
	show_index = true, -- show tab index
	show_modify = true, -- show buffer modification indicator
	show_icon = true, -- show file extension icon
	modify_indicator = "[-]", -- modify indicator
	no_name = "New", -- no name buffer name
	brackets = { "<", ">" }, -- file name brackets surrounding
})
