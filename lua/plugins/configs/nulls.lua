local M = {}
local nls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end
M.on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

local formatting = nls.builtins.formatting
local diagnostics = nls.builtins.diagnostics
local code_actions = nls.builtins.code_actions

M.sources = {
  formatting.isort.with({ extra_args = { "--profile black" } }),
  formatting.black.with({ extra_args = { "--fast" } }),
  -- diagnostics.ruff,
  diagnostics.djlint,
  formatting.djlint,
  formatting.stylua,
  formatting.prettier,
  formatting.shfmt,
  formatting.clang_format,
  code_actions.shellcheck,
  -- code_actions.eslint_d,
}

return M
