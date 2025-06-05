-- local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
-- local status, _ = pcall(vim.cmd, "colorscheme tokyonight-moon")
local status, _ = pcall(vim.cmd, "colorscheme tokyonight-night")
-- local status, _ = pcall(vim.cmd, "colorscheme tokyonight-day")
-- local status, _ = pcall(vim.cmd, "colorscheme tokyonight-storm")
if not status then
	print("Colorscheme not found!")
	return
end
