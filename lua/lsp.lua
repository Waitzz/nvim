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
        "jsonls"
    },
})

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", bufopts)
    vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<cr>", bufopts)
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", bufopts)
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename ++project<cr>", bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({
    on_attach = on_attach,
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
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.jsonls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})
