vim.g.navic_silence = true
require("nvim-navic").setup({
	icons = {
		File = " ",
		Class = " ",
		Property = " ",
		Field = " ",
		Enum = " ",
		Interface = " ",
		Variable = " ",
		Constant = " ",
		Boolean = " ",
		EnumMember = " ",
		Struct = " ",
		Event = " ",
		Operator = " ",
	},
	highlight = true,
	-- separator = " ",
	separator = " > ",
})
