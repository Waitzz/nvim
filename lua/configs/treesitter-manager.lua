local is_ok, treesitter_manager = pcall(require, "tree-sitter-manager")
if not is_ok then
    return
end

treesitter_manager.setup({
    ensure_installed = {
        "c",
        "cpp",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "asm",
        "bash",
        "json",
        "make",
        "python",
        "devicetree",
        "kconfig",
        "t32",
        "yaml",
        "regex",
    },
})
