-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

require("nvim-treesitter.install").compilers = { "clang" }

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"python",
		"r",
	},
	-- auto install above language parsers
	auto_install = true,
})
