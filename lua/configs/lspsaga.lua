local is_ok, lspsaga = pcall(require, "lspsaga")
if not is_ok then
    return
end

local opts = {noremap = true, silent = true}
vim.keymap.set("n", "<leader>c", "<cmd>Lspsaga incoming_calls<cr>", opts)
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<cr>", opts)

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
