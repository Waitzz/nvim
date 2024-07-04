local is_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not is_ok then
    return
end

treesitter.setup({
    ensure_installed = {"asm", "bash", "c", "lua", "json", "make"},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
})
