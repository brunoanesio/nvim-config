local opts = {
  show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = false,
  filetype_exclude = { "Neotree", "lazy", "dashboard", "help" },
  use_treesitter = false,
  use_treesitter_scope = false,
  context_char = "│",
  char = "┆",
}
return opts
