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
end
-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()
-- local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
-- local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
-- for type, icon in pairs(signs) do
-- 	local hl = "DiagnosticSign" .. type
-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "ﴞ ",
			[vim.diagnostic.severity.INFO] = " ",
		},
		linehl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
		},
		numhl = {
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})
-- configure R server
lspconfig["r_language_server"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "r" },
})

-- configure json server
lspconfig["biome"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "json" },
})

-- configure python server
lspconfig["pylsp"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "python" },
})

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html" },
})

-- configure typescript server with plugin
-- typescript.setup({
-- 	server = {
-- 		capabilities = capabilities,
-- 		on_attach = on_attach,
-- 	},
-- })
--
-- -- configure css server
-- lspconfig["cssls"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })
--
-- -- configure tailwindcss server
-- lspconfig["tailwindcss"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

--configure emmet language server
lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescript", "javascript", "css", "sass", "scss", "less", "svelte" },
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "lua" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT", -- 在 Neovim 中使用 LuaJIT
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" }, -- 识别 `vim` 全局变量
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true), -- 使服务器认识 Neovim 运行时文件
				checkThirdParty = false, -- 提高对 Neovim 特定全局变量的认识
			},
			telemetry = {
				enable = false, -- 禁用遥测数据
			},
		},
	},
})
