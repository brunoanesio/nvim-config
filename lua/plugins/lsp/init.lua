local M = {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason-lspconfig.nvim",
    },
    ---@diagnostic disable-next-line: unused-local
    config = function(_, opts)
        local utils = require("utils")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")
        local lsp_utils = require("plugins.lsp.lsp-utils")
        lsp_utils.setup()

        mason_lspconfig.setup({
            ensure_installed = utils.lsp_servers,
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    on_attach = lsp_utils.on_attach,
                    capabilities = lsp_utils.capabilities,
                })
            end,

            ["sumneko_lua"] = function()
                lspconfig.sumneko_lua.setup({
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                            telemetry = {
                                enable = false,
                            },
                        },
                    },
                })
            end,
            ["jsonls"] = function()
                lspconfig.jsonls.setup({
                    init_options = {
                        provideFormatter = false,
                    },
                })
            end,
            ["pylsp"] = function()
                lspconfig.pylsp.setup({
                    settings = {
                        pylsp = {
                            plugins = {
                                flake8 = {
                                    enabled = false, -- Disabled otherwise it gets duplicated
                                    maxLineLength = 95,
                                },
                                rope_completion = {
                                    enabled = false, -- Disabled otherwise it gets duplicated
                                },
                            },
                        },
                    },
                })
            end,
            ["tsserver"] = function()
                require("typescript").setup({
                    disable_formatting = true,
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
                        provideFormatter = false,
                    },
                })
            end,
        })
    end,
}

return M
