local is_ok, whitespace = pcall(require, "whitespace-nvim")
if not is_ok then
    return
end

whitespace.setup({
    ignored_filetypes = {
        "lazy",
        "dashboard",
        "mason",
        "lspinfo",
        "Trouble",
        "help",
        "",
    },
    vim.api.nvim_create_user_command("Whitespace", ":lua require('whitespace-nvim').trim()<cr>", {}),
})
