-- require("cmp_nvim_r").setup({
-- 	filetypes = { "r", "rmd", "quarto" },
-- 	doc_width = 58,
-- 	R_rconsole_width = 0,
-- })

local status, cmp_nvim_r = pcall(require, "cmp_nvim_r")
if not status then
	return
end

cmp_nvim_r.setup({
	filetypes = { "r", "rmd", "quarto" },
	-- doc_width = 58,
	R_rconsole_width = 90,
})
