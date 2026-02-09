local is_ok, outline = pcall(require, "outline")
if not is_ok then
    return
end

outline.setup({
    outline_window = {
        position = "left",
        width = 30,
        relative_width = false,
        auto_close = true,
    },

    outline_items = {
        show_symbol_details = false,
    },
})
