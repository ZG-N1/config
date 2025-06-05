local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
    print("LuaSnip not found!")
end
--
local blink = require("blink.cmp")
if not status_ok then
    print("Blink not found!")
end

-- 扩展snippets用于指定 文件类型
-- luasnip.filetype_extend("html", { "djangohtml" })
luasnip.filetype_extend("jinja.html", { "djangohtml" })
luasnip.filetype_extend("html", { "javascript" })
-- 加载vscode类snippets，确保已经安装如friendly-snippets
-- require("luasnip.loaders.from_vscode").load()
-- will exclude all html snippets
require("luasnip.loaders.from_vscode").lazy_load({
	-- exclude = { "html" },
})

luasnip.config.set_config({
	region_check_events = "InsertEnter",
	delete_check_events = "InsertLeave",
})
