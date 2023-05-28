local actions = require("telescope.actions")
local options = {
  defaults = {
    theme = "dropdown",
    prompt_prefix = "  ",
    previewer = true,
    select_strategy = "reset",
    selection_caret = " ",
    sorting_strategy = "ascending",
    path_display = { "smart" },
    winblend = 0,
    color_devicons = true,
    border = {},
    borderchars = nil,
    -- borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
    set_env = { ["COLORTERM"] = "truecolor" },
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "top",
      width = 0.75,
      height = 0.75,
      preview_cutoff = 120,
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git/",
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
  pickers = {
    find_files = {
      previewer = false,
      hidden = false,
    },
    git_files = {
      previewer = false,
    },
    current_buffer_fuzzy_find = {
      theme = "dropdown",
      previewer = false,
    },
    buffers = {
      theme = "dropdown",
      initial_mode = "normal",
      prompt_prefix = "",
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
    treesitter = {
      show_line = false,
      sorting_strategy = nil,
      layout_config = {
        horizontal = {
          width = 0.9,
          height = 0.75,
          preview_width = 0.6,
        },
      },
      symbols = {
        "class",
        "function",
        "method",
        "interface",
        "type",
        "const",
        "variable",
        "property",
        "constructor",
        "module",
        "struct",
        "trait",
        "field",
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
  extensions_list = { "fzf", "file_browser", "notify" },
}
return options
