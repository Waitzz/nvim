local is_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not is_ok then
    return
end

treesitter.setup({
    ensure_installed = {
        "c",
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
        "kconfig"
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
})
