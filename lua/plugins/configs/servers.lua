local M = {}
M.setup = function()
  local lsp_utils = require("plugins.utils.lsp-utils")
  local mason_lspconfig = require("mason-lspconfig")
  local lspconfig = require("lspconfig")

  lsp_utils.setup()

  mason_lspconfig.setup()

  mason_lspconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        on_attach = lsp_utils.on_attach,
        capabilities = lsp_utils.capabilities,
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
