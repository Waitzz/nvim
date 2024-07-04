local keymap_opts = {
    noremap = true, -- non-recursive
    silent = true, -- do not show message
}

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", keymap_opts)
vim.keymap.set("n", "<leader>t", "<cmd>Outline<CR>", keymap_opts)
vim.keymap.set("n", "<F12>", "<cmd>ToggleTerm<CR>", keymap_opts)
vim.keymap.set("t", "<F12>", "<cmd>ToggleTerm<CR>", keymap_opts)

