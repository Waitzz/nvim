local is_ok, catppuccin = pcall(require, "catppuccin")
if not is_ok then
    return
end

catppuccin.setup({
    auto_integrations = true,
    integrations = {
        noice = true,
    },
})
