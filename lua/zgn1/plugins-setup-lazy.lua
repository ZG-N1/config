-- 安装lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 唤醒lazy
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end


lazy.setup({
  -- whichkeys
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
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

  -- codecompanion
  {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter", 
      "ravitemer/mcphub.nvim",
    },
  },

  -- preview html and test API
  {"ray-x/web-tools.nvim"},

  -- recognize jinja2
  {"glench/vim-jinja2-syntax"},

  -- align text
  {"godlygeek/tabular"},

  -- lua functions that many plugins use
  {"nvim-lua/plenary.nvim", branch = "master"},

  -- preferred colorscheme
  -- {"bluz71/vim-nightfly-guicolors"}
  {"morhetz/gruvbox"},
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- tmux & split window navigation
  {"christoomey/vim-tmux-navigator"},

  {"szw/vim-maximizer"}, -- maximizes and restores current window

  {"tpope/vim-surround"}, -- add use keys (ys +motion + quote); delete (ds + quote);change (cs + quote_old + quote_new)
  {"vim-scripts/ReplaceWithRegister"},

  -- commenting with "gc"
  {"numToStr/Comment.nvim"}, -- need configured

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
  },

  -- icons
  {"nvim-tree/nvim-web-devicons"},

  -- statusline
  {"nvim-lualine/lualine.nvim"},

  -- time for lualine
  {"archibate/lualine-time"},

  -- tabline 标签管理
  {
    "crispgm/nvim-tabline",
  },

  -- leapnvim
  {"ggandor/leap.nvim"},

  -- fuzzy finding
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "nvim-telescope/telescope.nvim"},

  -- 补全
  {
    'saghen/blink.cmp',
    event = "VeryLazy",
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
  },

  -- 多光标编辑
  { "mg979/vim-visual-multi", branch = "master" },

  -- snippets
  {
    "L3MON4D3/LuaSnip", --snippet engine
    requires = { "rafamadriz/friendly-snippets" }, --provide some language snippets
    build = "make install_jsregexp", -- use to jump between snippet's filed
  },

  -- managing & installing lsp servers, linters & formatters
  {"williamboman/mason.nvim"}, -- in charge of managing lsp servers, linters & formatters
  {"williamboman/mason-lspconfig.nvim"}, -- bridges gap b/w mason & lspconfig
  -- configuring lsp servers
  {"neovim/nvim-lspconfig"}, -- easily configure language servers
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
  },
  -- enhanced lsp uis
  {"jose-elias-alvarez/typescript.nvim"}, -- additional functionality for typescript server (e.g. rename file & update imports)
  {"onsails/lspkind.nvim"}, -- vs-code like icons for autocompletion

  -- formatting & linting
  { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }, -- configure formatters & linters
  {"jayp0521/mason-null-ls.nvim"}, -- bridges gap b/w mason & null-ls
  {"stevearc/conform.nvim"},
  {"mfussenegger/nvim-lint"},
  {"mhartington/formatter.nvim"},

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

  -- auto closing
  {"windwp/nvim-autopairs"}, -- autoclose parents, brackets, quotes, etc...

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
  {
    'saghen/blink.nvim',
    -- all modules handle lazy loading internally
    lazy = false,
  },

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
    event = "VeryLazy",
    opts = {}
  },
})
