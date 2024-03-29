local opts = {
  ensure_installed = {
    "python",
    "lua",
    "javascript",
    "html",
    "css",
    "bash",
    "markdown",
    "markdown_inline",
    "vim",
    "rust",
    "norg",
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  context_commenstring = {
    enable = true,
    enable_autocmd = false,
  },
}
return opts
