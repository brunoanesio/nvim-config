local M = {}
M.opts = {
  terminals = {
    shell = vim.o.shell,
    list = {},
    type_opts = {
      float = {
        relative = "editor",
        row = 0.3,
        col = 0.25,
        width = 0.5,
        height = 0.4,
        border = "single",
      },
      horizontal = { location = "rightbelow", split_ratio = 0.3 },
      vertical = { location = "rightbelow", split_ratio = 0.5 },
    },
  },
  behavior = {
    autoclose_on_quit = {
      enabled = true,
      confirm = false,
    },
    close_on_exit = true,
    auto_insert = true,
  },
}
M.mappings = {
  { "<A-h>", "<cmd>lua require('nvterm.terminal').toggle('horizontal')<CR>", desc = "Toggle Horizontal terminal" },
  { "<A-v>", "<cmd>lua require('nvterm.terminal').toggle('vertical')<CR>", desc = "Toggle Vertical terminal" },
  { "<A-t>", "<cmd>lua require('nvterm.terminal').toggle('float')<CR>", desc = "Toggle Float terminal" },
}
return M
