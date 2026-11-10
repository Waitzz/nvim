local is_ok, trouble = pcall(require, "trouble")
if not is_ok then
    return
end

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { silent = true, desc = "Toggle Diagnostics" })
vim.keymap.set(
    "n",
    "<leader>xX",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    { silent = true, desc = "Toggle Buffer Diagnostics" }
)

trouble.setup({})
