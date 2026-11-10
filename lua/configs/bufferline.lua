local is_ok, bufferline = pcall(require, "bufferline")
if not is_ok then
    return
end

vim.keymap.set("n", "<leader>bj", "<cmd>BufferLinePick<cr>", { desc = "Pick Buffer" })

bufferline.setup({
    options = {},
})
