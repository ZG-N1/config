local status_ok, blink_cmp = pcall(require, "blink.cmp")
if not status_ok then
  return
end


blink_cmp.setup({
  appearance = {
    nerd_font_variant = 'mono',
  },
  completion = { 
    documentation = { auto_show = true }
  },
  snippets = { preset = 'luasnip' },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer', 'cmdline', 'omni' },
  },
  -- keymap = { preset = 'default' },
  keymap = {
    -- ["<D-c>"] = { "show" },
    -- ["<S-CR>"] = { "hide" },
    ["<CR>"] = { "select_and_accept", "fallback" },
    ["<C-j>"] = { "select_next", "fallback" },
    ["<C-k>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<PageDown>"] = { "scroll_documentation_down" },
    ["<PageUp>"] = { "scroll_documentation_up" },
  },
  kind_icons = {
    Text = "",
    Method = "󰊕",
    Function = "󰊕",
    Constructor = "",
    Field = "󰇽",
    Variable = "󰂡",
    Class = "󰜁",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "󰒕",
    Color = "󰏘",
    Reference = "",
    File = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰅲",
  },
  -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
