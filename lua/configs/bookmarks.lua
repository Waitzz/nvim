local is_ok, bookmarks = pcall(require, "bookmarks")
if not is_ok then
    return
end

bookmarks.setup({
    keymap = {
        toggle = "<leader>m",
        close = "<esc>"
    }
})
