local is_ok, blink_cmp = pcall(require, "blink.cmp")
if not is_ok then
    return
end

local capabilities = blink_cmp.get_lsp_capabilities()

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

    capabilities = capabilities,
})
vim.lsp.enable("lua_ls")

vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--header-insertion=never",
    },
    capabilities = capabilities,
})
vim.lsp.enable("clangd")

vim.lsp.config("bashls", {
    capabilities = capabilities,
})
vim.lsp.enable("bashls")

vim.lsp.config("pyright", {
    capabilities = capabilities,
})
vim.lsp.enable("pyright")

vim.lsp.config("jsonls", {
    capabilities = capabilities,
})
vim.lsp.enable("jsonls")

vim.lsp.config("asm_lsp", {
    capabilities = capabilities,
})
vim.lsp.enable("asm_lsp")
