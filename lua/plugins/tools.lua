return {
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	{
		"rmagatti/auto-session",
		opts = {
			auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
		},
		config = function(_, opts)
			require("auto-session").setup(opts)
		end,
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
				colors = require("catppuccin.groups.integrations.lsp_saga").custom_colors(),
				kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
			},
		},
		config = function(_, opts)
			require("lspsaga").setup(opts)
			-- Mappings
			-- Lsp finder
			vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
			-- Code action
			vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
			-- Rename
			vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>")
			-- Definition preview
			vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
			-- Show line and cursor diagnostics
			vim.keymap.set("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>")
			vim.keymap.set("n", "gL", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
			-- Diagnostic jump
			vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
			vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
			vim.keymap.set("n", "[E", function()
				require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end, { silent = true })
			vim.keymap.set("n", "]E", function()
				require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
			end, { silent = true })
			-- Outline
			vim.keymap.set("n", "<leader>ol", "<cmd>LSoutlineToggle<CR>")
			-- Hover
			vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
		end,
	},
}
