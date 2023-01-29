local map = vim.keymap.set
return {
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		opts = {
			symbol_in_winbar = {
				enable = true,
				separator = "  ",
			},
			ui = {
				border = "rounded",
				code_action = "",
				kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
			},
		},
		config = function(_, opts)
			require("lspsaga").setup(opts)
			-- Mappings
			-- Lsp finder
			map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
			-- Code action
			map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
			-- Rename
			map("n", "gr", "<cmd>Lspsaga rename<CR>")
			-- Definition preview
			map("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
			-- Show line and cursor diagnostics
			map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>")
			map("n", "gL", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
			-- Diagnostic jump
			map("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
			map("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
			map("n", "[E", function()
				require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end, { silent = true })
			map("n", "]E", function()
				require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
			end, { silent = true })
			-- Outline
			map("n", "<leader>ol", "<cmd>LSoutlineToggle<CR>")
			-- Hover
			map("n", "K", "<cmd>Lspsaga hover_doc<CR>")
		end,
	},
}
