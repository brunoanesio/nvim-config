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
			log_level = "info",
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
		"kiyoon/jupynium.nvim",
		build = "conda run --no-capture-output -n jupynium pip install .",
		enabled = vim.fn.isdirectory(vim.fn.expand("~/.local/share/miniconda3/envs/jupynium")),
		-- ft = "ju.py",
		-- cmd = "JupyniumStartAndAttachToServer",
		-- keys = {
		-- 	{ "<leader>x", "<cmd>JupyniumExecuteSelectedCells<CR>", desc = "Execute selected cells" },
		-- 	{ "<leader>K", "<cmd>JupyniumKernelHover<CR>", desc = "See value like LSP hover" },
		-- },
		opts = {
			-- python_host = vim.g.python3_host_prog or "python3",
			python_host = { "conda", "run", "--no-capture-output", "-n", "jupynium", "python" },
			use_default_keybindings = true,
		},
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
			{ "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Goto next diagnostic" },
			{ "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Goto prev diagnostic" },
			{ "<leader>ol", "<cmd>Lspsaga outline<CR>", desc = "Lspsaga outline" },
			{ "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Lspsaga hover" },
		},
	},
}
