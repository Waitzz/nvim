local is_ok, telescope = pcall(require, "telescope")
if not is_ok then
    return
end

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<leader>h", builtin.help_tags, {})
vim.keymap.set("n", "<leader>w", builtin.grep_string, {})

telescope.setup()
telescope.load_extension("bookmarks")
telescope.load_extension("projects")
