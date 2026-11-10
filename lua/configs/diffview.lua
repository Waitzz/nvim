local is_ok, diffview = pcall(require, "diffview")
if not is_ok then
    return
end

-- ,g group: git
vim.keymap.set("n", "<leader>gd", function()
    if next(require("diffview.lib").views) == nil then
        vim.cmd("DiffviewOpen")
    else
        vim.cmd("DiffviewClose")
    end
end, { silent = true, desc = "Git Diff (toggle)" })

vim.keymap.set("n", "<leader>gD", function()
    local branch = vim.fn.trim(vim.fn.system("git branch --show-current"))
    if vim.v.shell_error ~= 0 or branch == "" then
        vim.notify("Not on a git branch", vim.log.levels.WARN)
        return
    end
    vim.cmd("DiffviewOpen origin/" .. branch)
end, { silent = true, desc = "Git Diff (origin)" })

vim.keymap.set("n", "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", { silent = true, desc = "Git File History (current)" })
vim.keymap.set("n", "<leader>gl", "<cmd>DiffviewFileHistory<cr>", { silent = true, desc = "Git Log (repo)" })

diffview.setup({})
