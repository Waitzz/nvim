local is_ok, bufferline = pcall(require, "bufferline")
if not is_ok then
    return
end

vim.keymap.set("n", "<leader>p", "<cmd>BufferLinePick<cr>", {})

bufferline.setup({
    options = {}
})
