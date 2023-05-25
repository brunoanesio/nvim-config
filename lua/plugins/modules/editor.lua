return {
	-- {
	-- 	"brenoprata10/nvim-highlight-colors",
	-- 	event = "BufReadPre",
	-- 	opts = {
	-- 		render = "background",
	-- 		enable_tailwind = true,
	-- 	},
	-- },

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

	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "NeoTreeFocusToggle",
		keys = {
			{ "<leader>e", "<cmd>NeoTreeFocusToggle<CR>", desc = "Toggle NeoTree", remap = true },
		},
		opts = {
			close_if_last_window = true,
			popup_border_style = "none",
			filesystem = {
				follow_current_file = true,
				use_libuv_file_watcher = true,
			},
			source = {
				"filesystem",
				"buffers",
				"git_status",
			},
			source_selector = {
				winbar = true,
				statusline = false,
				content_layout = "center",
				tabs_layout = "equal",
				sources = {
					{ source = "filesystem", display_name = "  " },
					{ source = "buffers", display_name = "  " },
					{ source = "git_status", display_name = "  " },
					{ source = "diagnostics", display_name = " 裂" },
				},
			},
			window = {
				mappings = {
					["o"] = "open",
				},
			},
			default_component_configs = {
				indent = {
					with_expanders = true,
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},
		},
	},
}
