local M = {}

M.winbar_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
	"alpha",
	"lir",
	"Outline",
	"spectre_panel",
	"toggleterm",
	"DressingSelect",
	"Jaq",
	"harpoon",
	"dapui_scopes",
	"dapui_breakpoints",
	"dapui_stacks",
	"dapui_watches",
	"dap-repl",
	"dap-terminal",
	"dapui_console",
	"lab",
	"Markdown",
	"",
}

vim.o.winbar = "%Y %t %M %{%v:lua.require'nvim-navic'.get_location()%}"

return M
