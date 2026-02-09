local dashboard_is_ok, dashboard = pcall(require, "dashboard")
if not dashboard_is_ok then
    return
end

dashboard.setup({
    theme = "hyper",
    shortcut_type = "number",
    config = {
        week_header = {
            enable = true,
        },
        mru = {
            cwd_only = true,
        },
    },
})
