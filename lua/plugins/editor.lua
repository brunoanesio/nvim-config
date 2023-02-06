return {
	{
		"brenoprata10/nvim-highlight-colors",
		event = "BufReadPre",
		opts = {
			render = "background",
			enable_tailwind = true,
		},
	},

	{
		"numToStr/Comment.nvim",
		event = "BufReadPre",
		opts = {
			padding = true,
			sticky = true,
			ignore = nil,
			toggler = {
				line = "gcc",
				block = "gbc",
			},
			opleader = {
				line = "gc",
				block = "gb",
			},
			extra = {
				above = "gcO",
				below = "gco",
				eol = "gcA",
			},
			mappings = {
				basic = true,
				extra = true,
			},
			pre_hook = nil,
			post_hook = nil,
		},
	},

	{
		"RRethy/vim-illuminate",
		event = "BufReadPost",
		opts = {
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			delay = 100,
			filetypes_denylist = {
				"dirvish",
				"fugitive",
				"alpha",
				"dashboard",
				"NvimTree",
				"Toggleterm",
				"DressingSelect",
			},
			filetypes_allowlist = {},
			modes_denylist = {},
			modes_allowlist = {},
			under_cursor = true,
		},
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
		vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" }),
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" }),
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" }),
	},

	{
		"karb94/neoscroll.nvim",
		opts = {
			mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
			hide_cursor = true,
			stop_eof = true,
			respect_scrolloff = true,
			cursor_scrolls_alone = false,
			performance_mode = false,
		},
		config = function(_, opts)
			require("neoscroll").setup(opts)

			local t = {}

			t["<c-p>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
			t["<c-n>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }

			require("neoscroll.config").set_mappings(t)
		end,
	},

	{
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
		},
		opts = {
			update_cwd = true,
			respect_buf_cwd = true,
			open_on_setup = false,
			open_on_tab = false,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			view = {
				width = 40,
			},
			renderer = {
				highlight_git = true,
				indent_markers = {
					enable = true,
					icons = {
						corner = "└ ",
						edge = "│ ",
						item = "│ ",
						none = "  ",
					},
				},
				icons = {
					glyphs = {
						git = {
							unstaged = "",
							staged = "",
							unmerged = "",
							renamed = "",
							untracked = "",
							deleted = "",
							ignored = "",
						},
					},
				},
			},
			git = {
				enable = true,
				ignore = false,
				show_on_dirs = true,
				timeout = 400,
			},
			diagnostics = {
				enable = true,
				icons = {
					hint = "",
					info = " ",
					warning = "!",
					error = "✖",
				},
			},
		},
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
