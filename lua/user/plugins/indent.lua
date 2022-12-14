vim.opt.list = false
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup({
	filetype_exclude = { "NvimTree", "packer", "lsp-installer", "help" },
	-- space_char_blankline = " ",
	char = "▎",
	show_trailing_blankline_indent = false,
	show_first_indent_level = true,
	show_end_of_line = false,
	show_current_context = true,
	show_current_context_start = true,
	-- char_highlight_list = {
	-- 	"IndentBlanklineIndent1",
	-- 	"IndentBlanklineIndent2",
	-- 	"IndentBlanklineIndent3",
	-- 	"IndentBlanklineIndent4",
	-- 	"IndentBlanklineIndent5",
	-- 	"IndentBlanklineIndent6",
	-- },
})
