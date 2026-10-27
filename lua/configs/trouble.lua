local is_ok, trouble = pcall(require, "trouble")
if not is_ok then
    return
end

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts)
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", opts)

trouble.setup({})
