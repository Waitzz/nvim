local is_ok, comment = pcall(require, "Comment")
if not is_ok then
    return
end

comment.setup({
    toggler = {
        line = "<leader>cc",
        block = "<leader>cb",
    },

    opleader = {
        line = "<leader>cc",
        block = "<leader>cb",
    },
})
