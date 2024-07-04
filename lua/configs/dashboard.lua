local dashboard_is_ok, dashboard = pcall(require, "dashboard")
if not dashboard_is_ok then
    return
end

local project_is_ok, project = pcall(require, "project_nvim")
if project_is_ok then
    local function path_join(...)
        local path_sep = vim.loop.os_uname().version:match('Windows') and '\\' or '/'
        return table.concat({ ... }, path_sep)
    end
    local recent_projects = project.get_recent_projects()
    local cache_path = path_join(vim.fn.stdpath("cache"), "dashboard/cache")
    dump = "return " .. vim.inspect(recent_projects)
    vim.loop.fs_open(cache_path, "w", 384, function (err, fd)
        assert(not err, err)
        vim.loop.fs_write(fd, dump, 0, function (err, _)
            assert(not err, err)
            vim.loop.fs_ftruncate(fd, #dump, function (err, _)
                assert(not err, err)
                vim.loop.fs_close(fd)
            end)
        end)
    end)
end

dashboard.setup({
    theme = "hyper",
    shortcut_type = "number",
    config = {
        mru = {
            cwd_only = true
        }
    }
})
