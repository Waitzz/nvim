local is_ok, treesitter = pcall(require, "nvim-treesitter")
if not is_ok then
    return
end

treesitter.install({
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
    "kconfig",
    "t32",
    "yaml",
    "regex",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "c",
        "asm",
        "sh",
        "json",
        "make",
        "python",
        "dts",
        "kconfig",
        "trace32",
        "yaml",
    },
    callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
