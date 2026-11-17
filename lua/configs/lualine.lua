local is_ok, lualine = pcall(require, "lualine")
if not is_ok then
    return
end

local lualine_c = {
    {
        "filename",
        path = 1,
    },
}

local spinner_ok, spinner = pcall(require, "codecompanion._extensions.spinner.styles.lualine")
if spinner_ok then
    table.insert(lualine_c, spinner.get_lualine_component())
end

lualine.setup({
    sections = {
        lualine_c = lualine_c,
    },
})
