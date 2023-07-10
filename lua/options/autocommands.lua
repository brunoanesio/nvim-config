local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local bufcheck = augroup("bufcheck", {})
local yank_group = augroup("HighlightYank", {})
local FormatAutogroup = augroup("FormatAutogroup", {})
-- highlight yanks
autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})
-- start git messages in insert mode
autocmd("FileType", {
  group = bufcheck,
  pattern = { "gitcommit", "gitrebase" },
  command = "startinsert | 1",
})

autocmd("BufWritePost", {
  group = FormatAutogroup,
  pattern = "*",
  command = "FormatWrite",
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "<leader>V", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
  end,
})
