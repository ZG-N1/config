-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import blink.cmp plugin safely
local status_ok, blink = pcall(require, "blink.cmp")
if not status_ok then
	return
end


local on_attach = function(client, bufnr)
	vim.diagnostic.config({
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.HINT] = "",
				[vim.diagnostic.severity.INFO] = "",
			},
			linehl = {
				-- [vim.diagnostic.severity.ERROR] = "ErrorMsg",
			},
			numhl = {
				[vim.diagnostic.severity.WARN] = "WarningMsg",
			},
		},
    underline = false,
    virtual_text = false,
    })
end
-- used to enable autocompletion (assign to every lsp server config)
local capabilities = blink.get_lsp_capabilities()

-- configure R server
lspconfig["r_language_server"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "r" },
})

-- configure python server
lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "python" },
})

-- configure javascript server
lspconfig.eslint.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "javascript", "json" },
})

lspconfig.ts_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

--
-- configure html server
lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html" },
})

lspconfig.jinja_lsp.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "jinja.html" },
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "lua" },
	-- settings = {
	-- 	Lua = {
	-- 		-- runtime = {
	-- 		-- 	version = "LuaJIT", -- 在 Neovim 中使用 LuaJIT
	-- 		-- 	path = vim.split(package.path, ";"),
	-- 		-- },
	-- 		diagnostics = {
	-- 			globals = { "vim" }, -- 识别 `vim` 全局变量
	-- 		},
	-- 		-- workspace = {
	-- 		-- 	library = vim.api.nvim_get_runtime_file("", true), -- 使服务器认识 Neovim 运行时文件
	-- 		-- 	checkThirdParty = false, -- 提高对 Neovim 特定全局变量的认识
	-- 		-- },
	-- 		-- telemetry = {
	-- 		-- 	enable = false, -- 禁用遥测数据
	-- 		-- },
	-- 	},
	-- },
})

-- configure css server
lspconfig.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "css" },
})

lspconfig.vale.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
