local vim = vim
local opt = vim.opt -- for conciseness

-- line numbers
-- opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- -- have use nvim-ufo to replace
-- code fold (treesitter based)
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldlevel = 99

-- -- avoiding fold when open file in the first time

-- vim.cmd([[
--   augroup user_config_options
--     autocmd!
--     autocmd BufReadPost,FileReadPost * normal zR
--   augroup END
-- ]])

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line 未起作用,配合termguicolors就有效果了
opt.cursorline = true

-- appearance
-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-") -- consider string-string as whole word
-- terminal font
