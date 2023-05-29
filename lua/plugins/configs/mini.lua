local M = {}
M.comment_config = {
  hooks = {
    pre = function()
      require("ts_context_commentstring.internal").update_commentstring({})
    end,
  },
}
M.indent_config = {
  symbol = "│",
  options = { try_as_border = true },
}
M.indent = function()
  vim.api.nvim_create_autocmd("Filetype", {
    pattern = { "markdown", "lspsagafinder", "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })
end
M.animate_config = {
  resize = {
    enable = false,
  },
  open = {
    enable = false,
  },
  close = {
    enable = false,
  },
}
return M
