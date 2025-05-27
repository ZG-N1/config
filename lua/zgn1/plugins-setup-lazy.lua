local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end


lazy.setup({
  -- whichkey
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- preview html and test API
  {"ray-x/web-tools.nvim"},

  -- recognize jinja2
  {"glench/vim-jinja2-syntax"},

  -- align text
  {"godlygeek/tabular"},

  -- lua functions that many plugins use
  {"nvim-lua/plenary.nvim"},

  -- preferred colorscheme
  -- {"bluz71/vim-nightfly-guicolors"}
  {"morhetz/gruvbox"},

  -- tmux & split window navigation
  {"christoomey/vim-tmux-navigator"},

  {"szw/vim-maximizer"}, -- maximizes and restores current window

  {"tpope/vim-surround"}, -- add use keys (ys +motion + quote); delete (ds + quote);change (cs + quote_old + quote_new)
  {"vim-scripts/ReplaceWithRegister"},

  -- commenting with gc
  {"numToStr/Comment.nvim"}, -- need configured

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    -- dependencies = "nvim-tree/nvim-web-devicons"
  },

  -- icons
  {"nvim-tree/nvim-web-devicons"},

  -- statusline
  {"nvim-lualine/lualine.nvim"},

  -- time for lualine
  {"archibate/lualine-time"},

  -- tabline
  {
    "crispgm/nvim-tabline",
    -- dependencies = "nvim-tree/nvim-web-devicons",
  },

  -- leapnvim
  {"ggandor/leap.nvim"},

  -- fuzzy finding
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "nvim-telescope/telescope.nvim", branch = "0.1.x" },

  -- coc-nvim使vim像VScode,补全,语法检查
  { "neoclide/coc.nvim", branch = "release" },
  -- autocompletion
  {"hrsh7th/nvim-cmp"}, -- completion plugin
  {"hrsh7th/cmp-buffer"}, -- source for text in buffer
  {"hrsh7th/cmp-path"}, -- source for file system paths
  {"jalvesaq/cmp-nvim-r"},
  {"gaalcaras/ncm-R"},
  {"R-nvim/cmp-r"},
  {"hrsh7th/cmp-calc"},
  {"roxma/nvim-yarp"},
  {"ncm2/ncm2"},
  {"ncm2/ncm2-bufword"},
  {"ncm2/ncm2-path"},
  -- 多光标编辑
  { "mg979/vim-visual-multi", branch = "master" },

  -- snippets
  {
    "L3MON4D3/LuaSnip", --snippet engine
    requires = { "rafamadriz/friendly-snippets" }, --provide some language snippets
    build = "make install_jsregexp", -- use to jump between snippet's filed
  },
  {"saadparwaiz1/cmp_luasnip"}, -- for autocompletion

  -- managing & installing lsp servers, linters & formatters
  {"williamboman/mason.nvim"}, -- in charge of managing lsp servers, linters & formatters
  {"williamboman/mason-lspconfig.nvim"}, -- bridges gap b/w mason & lspconfig

  -- treesitter configuration
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  },

  -- nvim-ufo perfect fold
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      {"kevinhwang91/promise-async", lazy = true},
    },
  },
  -- configuring lsp servers
  {"neovim/nvim-lspconfig"}, -- easily configure language servers
  {"hrsh7th/cmp-nvim-lsp"}, -- for autocompletion
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      -- { "nvim-tree/nvim-web-devicons" },
      -- { "nvim-treesitter/nvim-treesitter" },
    },
  }, -- enhanced lsp uis
  {"jose-elias-alvarez/typescript.nvim"}, -- additional functionality for typescript server (e.g. rename file & update imports)
  {"onsails/lspkind.nvim"}, -- vs-code like icons for autocompletion

  -- formatting & linting
  { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }, -- configure formatters & linters
  {"jayp0521/mason-null-ls.nvim"}, -- bridges gap b/w mason & null-ls
  {"stevearc/conform.nvim"},
  {"mfussenegger/nvim-lint"},
  {"mhartington/formatter.nvim"},

  -- auto closing
  {"windwp/nvim-autopairs"}, -- autoclose parens, brackets, quotes, etc...

  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter" }, -- 确保在 treesitter 之后加载
    -- opts = {
    --   enable_close = true, -- 自动闭合标签
    --   enable_rename = true, -- 自动重命名标签
    -- }
  },

  -- indent-blankline
  {"lukas-reineke/indent-blankline.nvim"},

  -- lines-moving
  {"fedepujol/move.nvim"},

  -- git integration
  {"lewis6991/gitsigns.nvim"}, -- show line modifications on left hand side

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
  },

  -- for lua
  { "folke/neodev.nvim" },

  -- toggleterm
  {
    "akinsho/toggleterm.nvim",
  },

  -- dap
  {
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
  },
  { "rcarriga/nvim-dap-ui" },
  { "nvim-neotest/nvim-nio" },
  { "theHamsta/nvim-dap-virtual-text" },

  -- dap for python
  {
    "mfussenegger/nvim-dap-python"
  },

  --debug for javascript
  { "mxsdev/nvim-dap-vscode-js", 
    requires = { "mfussenegger/nvim-dap" } 
  },
  {
    "microsoft/vscode-js-debug",
    version = "1.x",
    lazy = true,
    build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
  },

  -- debug for R
  {
    "jalvesaq/Nvim-R",
    ft = { "r", "rmd" },
  },
  {"jalvesaq/R-Vim-runtime"},

  -- ai coding
  {
    "Exafunction/windsurf.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
  },
  {
    'kiddos/gemini.nvim',
    opts = {}
  },
})
