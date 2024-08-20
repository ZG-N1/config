-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--取消显示代码建议小灯泡
-- vim.cmd([[
--   autocmd FileType * setlocal signcolumn=no
-- ]])

-- 在进入和退出文档时保存和加载视图(如折叠状态)
-- vim.api.nvim_command("au BufWinLeave * silent mkview")
-- vim.api.nvim_command("au BufWinEnter * silent loadview")

-- 加载插件安装调用
require("zgn1.plugins-setup")

-- neovim相关配置调用
require("zgn1.core.options")
require("zgn1.core.keymaps")
require("zgn1.core.colorscheme")

-- 各插件的个性化配置调用
require("zgn1.plugins.comment")
require("zgn1.plugins.nvim-tree")
require("zgn1.plugins.lualine2")
require("zgn1.plugins.telescope")
require("zgn1.plugins.nvim-cmp_with-luasnip")
require("zgn1.plugins.lsp.mason")
require("zgn1.plugins.lsp.lspsaga")
require("zgn1.plugins.lsp.lspconfig")
require("zgn1.plugins.lsp.conform")
require("zgn1.plugins.lsp.linting")
require("zgn1.plugins.autopairs")
require("zgn1.plugins.treesitter")
require("zgn1.plugins.gitsigns")
require("zgn1.plugins.tabline")
require("zgn1.plugins.leap")
require("zgn1.plugins.indent-blankline")
require("zgn1.plugins.toggleterm")
require("zgn1.plugins.nvim-ufo")
-- require("zgn1.plugins.coc-snippets")
-- require("zgn1.plugins.luasnip")
require("zgn1.plugins.move")
require("zgn1.plugins.web-tools")
-- 调试插件调用
require("zgn1.plugins.cmp-nvim-r")
require("zgn1.plugins.nvim-r")
require("zgn1.plugins.ncm2")
require("zgn1.plugins.dap.nvim-dap")
require("zgn1.plugins.dap.dap-ui")
require("zgn1.plugins.dap.dap-python")
require("zgn1.plugins.dap.dap-javascript")
require("zgn1.plugins.null-ls")
-- require("zgn1.plugins.formatter")
