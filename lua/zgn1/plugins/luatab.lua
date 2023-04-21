-- import luatab plugin safely
local status, luatab = pcall(require, "luatab")
if not status then
	return
end

luatab.setup({})
