local is_ok, catppuccin = pcall(require, "catppuccin")
if not is_ok then
    return
end

catppuccin.setup({
    integrations = {
        notify = true,
        noice = true,
    },
})
