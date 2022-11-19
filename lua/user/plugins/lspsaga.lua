local map = vim.keymap.set
local opts = { silent = true }
local saga = require("lspsaga")

-- Config
saga.init_lsp_saga({
	move_in_saga = { prev = "<C-p>", next = "<C-n>" },
	max_preview_lines = 15,
	code_action_icon = "",
	border_style = "rounded",
	diagnostic_header = { " ", " ", " ", "" },
	code_action_lightbulb = {
		enable = true,
		enable_in_insert = false,
		sign = true,
	},
	symbol_in_winbar = {
		enable = false,
		separator = "  ",
		show_file = true,
		in_custom = false,
	},
	show_outline = {
		win_width = 35,
	},
	custom_kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
})

-- Mappings
-- Lsp finder
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
-- Code action
map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
-- Rename
map("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
-- Definition preview
map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
-- Show line and cursor diagnostics
map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
map("n", "gL", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
-- Diagnostic jump
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
map("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
map("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
-- Outline
map("n", "<leader>ol", "<cmd>LSoutlineToggle<CR>", opts)
-- Hover
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
