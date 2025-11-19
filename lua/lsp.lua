require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "bashls",
        "pyright",
        "jsonls",
        "asm_lsp",
        "yamlls"
    },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },

    capabilities = capabilities
})
vim.lsp.enable("lua_ls")

vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--header-insertion=never"
    },
    capabilities = capabilities
})
vim.lsp.enable("clangd")

vim.lsp.config("bashls", {
    capabilities = capabilities
})
vim.lsp.enable("bashls")

vim.lsp.config("pyright", {
    capabilities = capabilities
})
vim.lsp.enable("pyright")

vim.lsp.config("jsonls", {
    capabilities = capabilities
})
vim.lsp.enable("jsonls")

vim.lsp.config("asm_lsp", {
    capabilities = capabilities
})
vim.lsp.enable("asm_lsp")
