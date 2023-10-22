local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvimtree.setup({
	renderer = {
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
				modified = true,
				diagnostics = true,
				bookmarks = true,
			},
			glyphs = {
				folder = {
					arrow_closed = "",
					arrow_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
			git_placement = "before",
			modified_placement = "after",
		},
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	git = {
		enable = true,
		ignore = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		timeout = 400,
	},
	filters = {
		dotfiles = true,
		git_clean = false,
		no_buffer = false,
		custom = {},
	},
})
