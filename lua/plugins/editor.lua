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
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
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
			vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
		end,
	},

	-- {
	-- 	"karb94/neoscroll.nvim",
	-- 	opts = {
	-- 		mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
	-- 		hide_cursor = true,
	-- 		stop_eof = true,
	-- 		respect_scrolloff = true,
	-- 		cursor_scrolls_alone = false,
	-- 		performance_mode = false,
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("neoscroll").setup(opts)
	--
	-- 		local t = {}
	--
	-- 		t["<c-p>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
	-- 		t["<c-n>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
	--
	-- 		require("neoscroll.config").set_mappings(t)
	-- 	end,
	-- },

	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "NeoTreeFocusToggle",
		keys = {
			{ "<leader>e", "<cmd>NeoTreeFocusToggle<CR>", desc = "Toggle NeoTree" },
		},
		opts = {
			filesystem = {
				follow_current_file = true,
			},
			window = {
				mappings = {
					["o"] = "open",
				},
			},
		},
	},
}
