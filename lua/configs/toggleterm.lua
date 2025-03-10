local is_ok, toggleterm = pcall(require, "toggleterm")
if not is_ok then
    return
end

vim.o.shell = "bash"
vim.o.shellcmdflag = "-s"

toggleterm.setup({
    direction = "float"
})
