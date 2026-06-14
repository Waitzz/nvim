local is_ok, mason = pcall(require, "mason")
if not is_ok then
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

local lsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not lsp_ok then
    return
end

mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "bashls",
        "pyright",
        "jsonls",
        "asm_lsp",
        "yamlls",
        "rust_analyzer",
        "taplo",
    },
})

local tool_ok, mason_tool = pcall(require, "mason-tool-installer")
if not tool_ok then
    return
end

mason_tool.setup({
    ensure_installed = {
        "stylua",
        "clang-format",
        "shfmt",
        "ruff",
        "prettier",
    },
})

local dap_ok, mason_dap = pcall(require, "mason-nvim-dap")
if not dap_ok then
    return
end

mason_dap.setup({
    ensure_installed = {
        "python",
        "bash",
    },
    automatic_installation = true,
})
