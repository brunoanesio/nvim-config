return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-symbols.nvim",
		},
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				pickers = {
					find_files = {
						previewer = false,
						hidden = false,
					},
					current_buffer_fuzzy_find = {
						theme = "dropdown",
						previewer = false,
					},
					buffers = {
						theme = "dropdown",
						initial_mode = "normal",
						previewer = false,
						mappings = {
							i = {
								["<C-d>"] = require("telescope.actions").delete_buffer,
							},
							n = {
								["dd"] = require("telescope.actions").delete_buffer,
							},
						},
					},
				},
				defaults = {
					hidden = false,
					prompt_prefix = " ",
					selection_caret = " ",
					path_display = { "smart" },
					layout_strategy = "horizontal",
					layout_config = {
						center = {
							prompt_position = "top",
						},
						prompt_position = "bottom",
						width = 0.8,
						preview_cutoff = 40,
					},
					preview = {
						hide_on_startup = false,
					},
					mappings = {
						i = {
							["<C-j>"] = actions.cycle_history_next,
							["<C-k>"] = actions.cycle_history_prev,

							["<C-n>"] = actions.move_selection_next,
							["<C-p>"] = actions.move_selection_previous,

							["<C-b>"] = actions.preview_scrolling_up,
							["<C-f>"] = actions.preview_scrolling_down,

							["<C-c>"] = actions.close,

							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,

							["<CR>"] = actions.select_default,
							["<C-s>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,

							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-l>"] = actions.complete_tag,
							["<C-h>"] = actions.which_key,
							["<C-o>"] = require("telescope.actions.layout").toggle_preview,
						},
						n = {
							["<CR>"] = actions.select_default,
							["<esc>"] = actions.close,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,
							["<C-b>"] = actions.results_scrolling_up,
							["<C-f>"] = actions.results_scrolling_down,

							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["H"] = actions.move_to_top,
							["M"] = actions.move_to_middle,
							["L"] = actions.move_to_bottom,
							["q"] = actions.close,
							["s"] = actions.select_horizontal,
							["v"] = actions.select_vertical,
							["t"] = actions.select_tab,

							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["gg"] = actions.move_to_top,
							["G"] = actions.move_to_bottom,

							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,

							["?"] = actions.which_key,
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("notify")
		end,
	},
}
