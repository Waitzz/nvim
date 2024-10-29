local is_ok, autopairs = pcall(require, "nvim-autopairs")
if not is_ok then
    return
end

autopairs.setup({
    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
    fast_wrap = {
        cursor_pos_before = false
    }
})
