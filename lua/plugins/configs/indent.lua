local opts = {
  exclude = { filetypes = { "Neotree", "lazy", "dashboard", "help" } },
  indent = {
    enabled = true,
    char = "▎",
  },
  scope = {
    enabled = true,
    show_start = true,
    show_end = false,
    char = "▎",
    include = {
      node_type = {
        lua = { "return_statement", "table_constructor" },
        python = { "function", "if_statement", "for_statement" },
      },
    },
  },
}
return opts
