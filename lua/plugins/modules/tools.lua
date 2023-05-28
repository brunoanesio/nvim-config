return {
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {
			options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" },
		},
		keys = {
			{
				"<leader>qs",
				function()
					require("persistence").load()
				end,
				desc = "Restore Session",
			},
			{
				"<leader>ql",
				function()
					require("persistence").load({ last = true })
				end,
				desc = "Restore Last Session",
			},
			{
				"<leader>qd",
				function()
					require("persistence").stop()
				end,
				desc = "Don't Save Current Session",
			},
		},
	},

	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		config = function()
			local rt = require("rust-tools")
			local opts = {
				server = {
					on_attach = function(_, bufnr)
						-- Hover actions
						vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
						-- Code action groups
						vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
					end,
				},
				tools = {
					inlay_hints = {
						auto = true,
					},
				},
			}
			rt.setup(opts)
		end,
	},

	{
		"utilyre/barbecue.nvim",
		event = "BufRead",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			theme = "catppuccin",
		},
	},

	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		opts = {
			symbol_in_winbar = {
				enable = false,
				separator = "  ",
			},
			ui = {
				border = "single",
				code_action = "",
				kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
			},
			lightbulb = {
				enable = true,
				virtual_text = false,
			},
			beacon = {
				enable = true,
				frequency = 7,
			},
		},
		keys = {
			{ "gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "Lspsaga lsp finder" },
			{ "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "Lspsaga Code Action" },
			{ "gr", "<cmd>Lspsaga rename<CR>", desc = "Lspsaga rename" },
			{ "gR", "<cmd>Lspsaga rename ++project<CR>", desc = "Lspsaga rename ++project" },
			{ "gd", "<cmd>Lspsaga peek_definition<CR>", desc = "Lspsaga peek definition" },
			{ "gD", "<cmd>Lspsaga goto_definition<CR>", desc = "Goto definition" },
			{ "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Lspsaga show line diagnostics" },
			{ "sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = "Lspsaga show buf diagnostics" },
			{ "sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", desc = "Lspsaga show workspace diagnostics" },
			{ "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Goto next diagnostic" },
			{ "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Goto prev diagnostic" },
			{ "<leader>ol", "<cmd>Lspsaga outline<CR>", desc = "Lspsaga outline" },
			{ "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Lspsaga hover" },
			{ "<A-t>", "<cmd>Lspsaga term_toggle<CR>", desc = "Lspsaga Floating Term" },
		},
	},
}
