local is_ok, lspsaga = pcall(require, "lspsaga")
if not is_ok then
    return
end

lspsaga.setup({
    finder = {
        keys = {
            toggle_or_open = "<enter>",
            quit = "<esc>"
        }
    }
})
