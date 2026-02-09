local is_ok, nvim_tree = pcall(require, "nvim-tree")
if not is_ok then
    return
end

nvim_tree.setup({
    view = {
        side = "right",
        width = 30,
    },

    actions = {
        open_file = {
            quit_on_open = true,
        },
    },

    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true,
    },
})
