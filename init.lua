-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
require("zgn1.plugins.nvim-cmp")
require("zgn1.plugins.lsp.mason")
require("zgn1.plugins.lsp.lspsaga")
require("zgn1.plugins.lsp.lspconfig")
require("zgn1.plugins.lsp.null-ls")
require("zgn1.plugins.autopairs")
require("zgn1.plugins.treesitter")
require("zgn1.plugins.gitsigns")
require("zgn1.plugins.tabline")
require("zgn1.plugins.leap")
require("zgn1.plugins.indent-blankline")
require("zgn1.plugins.toggleterm")
require("zgn1.plugins.nvim-ufo")

-- 调试插件调用
require("zgn1.plugins.cmp-nvim-r")
require("zgn1.plugins.nvim-r")
require("zgn1.plugins.dap.dap-ui")
require("zgn1.plugins.dap.dap-python")

-- 调用AI配置
require("zgn1.plugins.ai.bitoai")
