local status_, conform = pcall(require, "conform")
if not status_ then
	return
end

conform.setup({
	formatters_by_ft = {
		lua = { "stylua", "lua-language-server" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd", "prettier", "biome" } },
		typescript = { { "prettierd", "prettier", "biome" } },
		css = { "prettierd" },
		html = { "prettierd" },
		json = { "prettierd" },
		yaml = { "prettierd" },
		markdown = { "prettierd" },
		r = { "r-languageserver" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		async = false,
		lsp_fallback = true,
	},
	vim.keymap.set({ "n", "v" }, "<leader>mp", function()
		conform.format({
			timeout_ms = 500,
			async = false,
			lsp_fallback = true,
		})
	end, { desc = "Format file or range" }),
})
