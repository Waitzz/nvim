local is_ok, lspsaga = pcall(require, "lspsaga")
if not is_ok then
    return
end

local opts = {noremap = true, silent = true}

vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<cr>", opts)
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename ++project<cr>", opts)
vim.keymap.set("n", "<leader>h", "<cmd>Lspsaga incoming_calls<cr>", opts)
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<cr>", opts)
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
vim.keymap.set("n", "[E", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)

lspsaga.setup({
    finder = {
        keys = {
            toggle_or_open = "<enter>",
            quit = "<esc>"
        }
    },

    outline = {
        layout = "float",
        keys = {
            toggle_or_jump = "<enter>",
            quit = "<esc>"
        }
    },

    callhierarchy = {
        keys = {
            edit = "<enter>",
            quit = "<esc>"
        }
    }
})
