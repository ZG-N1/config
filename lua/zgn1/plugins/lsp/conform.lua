local status_, conform = pcall(require, "conform")
if not status_ then
	return
end

-- formating file

conform.setup({
	formatters_by_ft = {
		lua = { "stylua", "lua-language-server", stop_after_first = true },
		python = { "black", "isort", stop_after_first = true },
		javascript = { "prettier", "prettierd", "biome", stop_after_first = true },
		typescript = { "prettier", "prettierd", "biome", stop_after_first = true },
		css = { "prettierd" },
		html = { "prettierd" },
		json = { "prettierd" },
		yaml = { "prettierd" },
		markdown = { "prettierd" },
		r = { "r-languageserver" },
		jinja = { "djlint" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 5000,
		async = false,
		lsp_fallback = true,
	},
	vim.keymap.set({ "n", "v" }, "<leader>mp", function()
		conform.format({
			timeout_ms = 5000,
			async = false,
			lsp_fallback = true,
		})
	end, { desc = "Format file or range" }),
})
