-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end
-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end
-- 扩展snippets用于指定 文件类型
luasnip.filetype_extend("html", { "djangohtml" })
-- 加载vscode类snippets，确保已经安装如friendly-snippets
require("luasnip.loaders.from_vscode").load()

-- vim.opt.completeopt = "menu,menuone,noselect"
--

cmp.setup({
	-- snippet = {
	-- 	expand = function(args)
	-- 		luasnip.lsp_expand(args.body)
	-- 	end,
	-- },
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				if luasnip.expandable() then
					luasnip.expand()
				else
					cmp.confirm({
						select = true,
					})
					-- fallback()
				end
			else
				fallback()
			end
		end),

		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.locally_jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		-- ... Your other mappings ...
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
		{ name = "cmp_nvim_r" }, -- from nvim_r
		{ name = "calc" },
		{ name = "cmp_r" },
	}),
	-- configure lspkind for vs-code like icons
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				path = "[Path]",
				cmp_nvim_r = "[R]",
				cmp_r = "[R]",
			})[entry.source.name]
			vim_item.dup = ({
				buffer = 0,
				nvim_lsp = 0,
				luasnip = 0,
				path = 0,
				cmp_nvim_r = 0,
				cmp_r = 0,
			})[entry.source.name] or 0
			return vim_item
		end,
	},

	sorting = {
		comparators = {
			cmp.config.compare.recently_used,
			cmp.config.compare.offset, -- 根据文档中的偏移量排序
			cmp.config.compare.exact, -- 精确匹配
			cmp.config.compare.score, -- 根据分数排序
			cmp.config.compare.kind, -- 根据类型排序
			cmp.config.compare.sort_text, -- 根据文本排序
			cmp.config.compare.length, -- 根据长度排序
			cmp.config.compare.order, -- 最后的排序
		},
	},
})

luasnip.config.set_config({
	region_check_events = "InsertEnter",
	delete_check_events = "InsertLeave",
})
