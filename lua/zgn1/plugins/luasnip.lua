-- local luasnip = require("luasnip")
--
-- luasnip.config.set_config({
-- 	region_check_events = "InsertEnter",
-- 	delete_check_events = "InsertLeave",
--  })

local luasnip = require("luasnip")

local cmp = require("cmp")

cmp.setup({

	-- ... Your other configuration ...

	mapping = {

		-- ... Your other mappings ...
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
	},

	-- ... Your other configuration ...
})
luasnip.config.set_config({
	region_check_events = "InsertEnter",
	delete_check_events = "InsertLeave",
})
