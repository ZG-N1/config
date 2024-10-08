-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\ZGN1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1716656478\\share\\lua\\5.1\\?.lua;C:\\Users\\ZGN1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1716656478\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\ZGN1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1716656478\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\ZGN1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1716656478\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\ZGN1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1716656478\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["Nvim-R"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\Nvim-R",
    url = "https://github.com/jalvesaq/Nvim-R"
  },
  ["R-Vim-runtime"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\R-Vim-runtime",
    url = "https://github.com/jalvesaq/R-Vim-runtime"
  },
  ReplaceWithRegister = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\ReplaceWithRegister",
    url = "https://github.com/vim-scripts/ReplaceWithRegister"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-r"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-r",
    url = "https://github.com/jalvesaq/cmp-nvim-r"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-r"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-r",
    url = "https://github.com/R-nvim/cmp-r"
  },
  cmp_luasnip = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["conform.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["leap.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine-time"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine-time",
    url = "https://github.com/archibate/lualine-time"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-null-ls.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason-null-ls.nvim",
    url = "https://github.com/jayp0521/mason-null-ls.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["move.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\move.nvim",
    url = "https://github.com/fedepujol/move.nvim"
  },
  ["ncm-R"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\ncm-R",
    url = "https://github.com/gaalcaras/ncm-R"
  },
  ncm2 = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\ncm2",
    url = "https://github.com/ncm2/ncm2"
  },
  ["ncm2-bufword"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\ncm2-bufword",
    url = "https://github.com/ncm2/ncm2-bufword"
  },
  ["ncm2-path"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\ncm2-path",
    url = "https://github.com/ncm2/ncm2-path"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-dap-vscode-js"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-dap-vscode-js",
    url = "https://github.com/mxsdev/nvim-dap-vscode-js"
  },
  ["nvim-lint"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lint",
    url = "https://github.com/mfussenegger/nvim-lint"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-nio"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-nio",
    url = "https://github.com/nvim-neotest/nvim-nio"
  },
  ["nvim-tabline"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tabline",
    url = "https://github.com/crispgm/nvim-tabline"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ufo"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["nvim-yarp"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-yarp",
    url = "https://github.com/roxma/nvim-yarp"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  tabular = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["typescript.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  ["vim-jinja2-syntax"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-jinja2-syntax",
    url = "https://github.com/glench/vim-jinja2-syntax"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["vscode-js-debug"] = {
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vscode-js-debug",
    url = "https://github.com/microsoft/vscode-js-debug"
  },
  ["web-tools.nvim"] = {
    loaded = true,
    path = "C:\\Users\\ZGN1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\web-tools.nvim",
    url = "https://github.com/ray-x/web-tools.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd nvim-ts-autotag ]]
time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType r ++once lua require("packer.load")({'Nvim-R'}, { ft = "r" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType rmd ++once lua require("packer.load")({'Nvim-R'}, { ft = "rmd" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: C:\Users\ZGN1\AppData\Local\nvim-data\site\pack\packer\opt\Nvim-R\ftdetect\r.vim]], true)
vim.cmd [[source C:\Users\ZGN1\AppData\Local\nvim-data\site\pack\packer\opt\Nvim-R\ftdetect\r.vim]]
time([[Sourcing ftdetect script at: C:\Users\ZGN1\AppData\Local\nvim-data\site\pack\packer\opt\Nvim-R\ftdetect\r.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
