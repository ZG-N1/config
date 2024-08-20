--
-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- go to references
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

	vim.diagnostic.config({
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.HINT] = "",
				[vim.diagnostic.severity.INFO] = "",
			},
			linehl = {
				"",
				-- [vim.diagnostic.severity.ERROR] = "ErrorMsg",
			},
			numhl = {
				[vim.diagnostic.severity.WARN] = "WarningMsg",
			},
		},
	})
end
-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- configure R server
lspconfig["r_language_server"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "r" },
})

-- configure javascript server
lspconfig.biome.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "javascript", "json" },
})

lspconfig.tsserver.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure python server

lspconfig.pyright.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- lspconfig.pylsp.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	filetypes = { "python" },
-- 	settings = {
-- 		pylsp = {
-- 			configurationSources = { "flake8" },
-- 			plugins = {
-- 				pylint = {
-- 					enabled = false,
-- 				},
-- 				flake8 = {
-- 					enabled = true,
-- 					extendIgnore = { "E501" },
-- 				},
-- 				mccabe = {
-- 					enabled = false,
-- 				},
-- 				pycodestyle = {
-- 					enabled = false,
-- 				},
-- 				pyflakes = {
-- 					enabled = false,
-- 				},
-- 			},
-- 		},
-- 	},
-- })
--
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
	settings = {
		Lua = {
			-- runtime = {
			-- 	version = "LuaJIT", -- 在 Neovim 中使用 LuaJIT
			-- 	path = vim.split(package.path, ";"),
			-- },
			diagnostics = {
				globals = { "vim" }, -- 识别 `vim` 全局变量
			},
			-- workspace = {
			-- 	library = vim.api.nvim_get_runtime_file("", true), -- 使服务器认识 Neovim 运行时文件
			-- 	checkThirdParty = false, -- 提高对 Neovim 特定全局变量的认识
			-- },
			-- telemetry = {
			-- 	enable = false, -- 禁用遥测数据
			-- },
		},
	},
})

-- configure css server
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
