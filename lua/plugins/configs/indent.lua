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
  },
}
return opts
