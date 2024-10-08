-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- packer can mange itself
	use("wbthomason/packer.nvim")

	-- preview html and test API
	use("ray-x/web-tools.nvim")

	-- recognize jinja2
	use("glench/vim-jinja2-syntax")

	-- align text
	use("godlygeek/tabular")

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- preferred colorscheme
	-- use("bluz71/vim-nightfly-guicolors")
	use("morhetz/gruvbox")

	-- tmux & split window navigation
	use("christoomey/vim-tmux-navigator")

	use("szw/vim-maximizer") -- maximizes and restores current window

	use("tpope/vim-surround") -- add use keys (ys +motion + quote); delete (ds + quote);change (cs + quote_old + quote_new)
	use("vim-scripts/ReplaceWithRegister")

	-- commenting with gc
	use("numToStr/Comment.nvim") -- need configured

	-- file explorer
	use({
		"nvim-tree/nvim-tree.lua",
		-- require = "nvim-tree/nvim-web-devicons"
	})

	-- icons
	use("nvim-tree/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- time for lualine
	use("archibate/lualine-time")

	-- tabline
	use({
		"crispgm/nvim-tabline",
		-- require = "nvim-tree/nvim-web-devicons",
	})

	-- leapnvim
	use("ggandor/leap.nvim")

	-- fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- coc-nvim使vim像VScode,补全,语法检查
	use({ "neoclide/coc.nvim", branch = "release" })
	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	use("jalvesaq/cmp-nvim-r")
	use("gaalcaras/ncm-R")
	use("R-nvim/cmp-r")
	use("hrsh7th/cmp-calc")
	use("roxma/nvim-yarp")
	use("ncm2/ncm2")
	use("ncm2/ncm2-bufword")
	use("ncm2/ncm2-path")
	-- 多光标编辑
	use({ "mg979/vim-visual-multi", branch = "master" })

	-- snippets
	use({
		"L3MON4D3/LuaSnip", --snippet engine
		requires = { "rafamadriz/friendly-snippets" }, --provide some language snippets
		run = "make install_jsregexp", -- use to jump between snippet's filed
	})
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- nvim-ufo perfect fold
	use({
		"kevinhwang91/nvim-ufo",
		requires = {
			"kevinhwang91/promise-async",
		},
	})

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			-- { "nvim-tree/nvim-web-devicons" },
			-- { "nvim-treesitter/nvim-treesitter" },
		},
	}) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	use("stevearc/conform.nvim")
	use("mfussenegger/nvim-lint")
	use("mhartington/formatter.nvim")

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- indent-blankline
	use("lukas-reineke/indent-blankline.nvim")

	-- lines-moving
	use("fedepujol/move.nvim")

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		opt = true,
		ft = "markdown",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- for lua
	use({ "folke/neodev.nvim" })

	-- toggleterm
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
	})

	-- dap
	use({
		"mfussenegger/nvim-dap",
		recommended = true,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			-- virtual text for the debugger
			dependencies = {
				{ "nvim-neotest/nvim-nio" },
				{
					"theHamsta/nvim-dap-virtual-text",
					opts = {},
				},
			},
		},
	})
	use({ "rcarriga/nvim-dap-ui" })
	use({ "nvim-neotest/nvim-nio" })
	use({ "theHamsta/nvim-dap-virtual-text" })

	-- dap for python
	use({
		"mfussenegger/nvim-dap-python",
	})

	--debug for javascript
	use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })
	use({
		"microsoft/vscode-js-debug",
		version = "1.x",
		opt = true,
		run = "npm i && npm run compile vsDebugServerBundle && mv dist out",
	})

	-- debug for R
	use({
		"jalvesaq/Nvim-R",
		ft = { "r", "rmd" },
	})
	use("jalvesaq/R-Vim-runtime")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
