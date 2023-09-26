-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine gruvbox theme
local lualine_gruvbox = require("lualine.themes.gruvbox")

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = lualine_gruvbox,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
			"diagnostics",
		},
		lualine_c = { "filename" },
		lualine_x = {
			-- "cdate",
			"ctime",
		},
		lualine_y = {
			"encoding",
			"fileformat",
			"filetype",
			"progress",
		},
		lualine_z = { "location" },
	},
})
