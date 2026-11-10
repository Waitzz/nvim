local is_ok, bufferline = pcall(require, "bufferline")
if not is_ok then
    return
end

vim.keymap.set("n", "<leader>bj", "<cmd>BufferLinePick<cr>", { silent = true, desc = "Buffer Jump" })

bufferline.setup({
    options = {},
})
