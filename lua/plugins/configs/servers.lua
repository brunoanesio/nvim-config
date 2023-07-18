local M = {}
M.setup = function()
  local mason_lspconfig = require("mason-lspconfig")
  local lspconfig = require("lspconfig")
  local on_attach = require("plugins.configs.lsp").on_attach
  local capabilities = require("plugins.configs.lsp").capabilities

  mason_lspconfig.setup()

  mason_lspconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
    ["emmet_ls"] = function()
      lspconfig.emmet_ls.setup({
        filetypes = { "html", "htmldjango", "css", "typescriptreact", "javascriptreact" },
      })
    end,
    ["html"] = function()
      lspconfig.html.setup({
        filetypes = { "html", "htmldjango" },
        init_options = {
          embeddedLanguages = {
            configurationSection = { "html", "css", "javascript" },
            css = true,
            javascript = true,
          },
        },
      })
    end,
    ["clangd"] = function()
      lspconfig.clangd.setup({
        cmd = { "clangd", "--offset-encoding=utf-16" },
      })
    end,
    ["ruff_lsp"] = function()
      lspconfig.ruff_lsp.setup({
        client = {
          server_capabilities = {
            hoverProvider = false,
          },
        },
      })
    end,
  })
end

return M
