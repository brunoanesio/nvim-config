return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = {} },
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
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
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>li", "<cmd>Mason<CR>", desc = "Mason" } },
    opts = {
      pip = {
        upgrade_pip = true,
      },
      ui = {
        border = "none",
        icons = {
          package_installed = "󰄳 ",
          package_pending = " ",
          package_uninstalled = " ",
        },
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local utils = require("plugins.utils")
      local mr = require("mason-registry")
      local packages = utils.mason_packages
      for _, package in ipairs(packages) do
        local p = mr.get_package(package)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local nls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      local function has_stylua_configured(_utils)
        return _utils.root_has_file({ ".stylua.toml", "stylua.toml" })
      end
      local lsp_formatting = function(bufnr)
        vim.lsp.buf.format({
          filter = function(client)
            return client.name == "null-ls"
          end,
          bufnr = bufnr,
        })
      end
      local on_attach = function(client, bufnr)
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

      nls.setup({
        sources = {
          formatting.isort.with({ extra_args = { "--profile black" } }),
          formatting.black.with({ extra_args = { "--fast" } }),
          -- diagnostics.ruff,
          diagnostics.djlint,
          formatting.djlint,
          formatting.stylua.with({ condition = has_stylua_configured }),
          formatting.prettier,
          formatting.shfmt,
          formatting.clang_format,
          code_actions.eslint_d,
        },
        on_attach = on_attach,
      })
    end,
  },
}
