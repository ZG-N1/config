-- import telescope plugin safely
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

-- import telescope actions safely
local actions_ok, actions = pcall(require, "telescope.actions")
if not actions_ok then
	return
end

-- configure telescope
telescope.setup({
	-- configure custom mappings
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
	},
})

telescope.load_extension("fzf")
