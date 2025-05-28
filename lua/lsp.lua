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
        "asm_lsp"
    },
})

local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({
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

lspconfig.clangd.setup({
    cmd = {
        "clangd",
        "--header-insertion=never"
    },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
    capabilities = capabilities
})

lspconfig.bashls.setup({
    capabilities = capabilities
})

lspconfig.pyright.setup({
    capabilities = capabilities
})

lspconfig.jsonls.setup({
    capabilities = capabilities
})

lspconfig.asm_lsp.setup({
    capabilities = capabilities
})
