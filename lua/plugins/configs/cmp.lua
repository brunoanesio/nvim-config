local cmp = require("cmp")
local luasnip = require("luasnip")
local icons = require("plugins.utils").cmp_kinds

local format = function(_, item)
  local MAX_LABEL_WIDTH = 55
  local function whitespace(max, len)
    return (" "):rep(max - len)
  end

  local content = item.abbr
  if #content > MAX_LABEL_WIDTH then
    item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ".."
  else
    item.abbr = content .. whitespace(MAX_LABEL_WIDTH, #content)
  end

  item.kind = " " .. (icons[item.kind] or icons.Unknown) .. "│"

  item.menu = nil
  return item
end

local formatting = {
  fields = { "kind", "abbr" },
  format = format,
}

local window = {
  completion = cmp.config.window.bordered({
    scrollbar = true,
    border = "single",
    col_offset = -1,
    side_padding = 0,
  }),
  documentation = cmp.config.window.bordered({
    scrollbar = true,
    border = "single",
  }),
}

window.documentation.max_height = 18
window.documentation.max_width = 80
window.documentation.side_padding = 1

local options = {
  completion = {
    completeopt = "menu,menuone,noinsert,preview",
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-c>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  sources = {
    { name = "codeium" },
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
  formatting = formatting,
  window = window,
  experimental = { ghost_text = true },
}
return options
