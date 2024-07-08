local is_ok, lualine = pcall(require, "lualine")
if not is_ok then
    return
end

lualine.setup({
    sections = {
        lualine_c = {
            {
                "filename",
                path = 1
            }
        }
    }
})
