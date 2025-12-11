local is_ok, toggleterm = pcall(require, "toggleterm")
if not is_ok then
    return
end

toggleterm.setup({
    direction = "float"
})
