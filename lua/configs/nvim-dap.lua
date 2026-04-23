local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
    return
end

local py_ok, py = pcall(require, "dap-python")
if py_ok then
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function()
            py.setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
        end,
    })
end

local virt_ok, virt = pcall(require, "nvim-dap-virtual-text")
if virt_ok then
    virt.setup({})
end

local ui_ok, dapui = pcall(require, "dapui")
if ui_ok then
    dapui.setup()
end

dap.listeners.before.attach.dapui_config = function()
    if ui_ok then
        dapui.open()
    end
end

dap.listeners.before.launch.dapui_config = function()
    if ui_ok then
        dapui.open()
    end
end

dap.listeners.before.event_terminated.dapui_config = function()
    if ui_ok then
        dapui.close()
    end
end

dap.listeners.before.event_exited.dapui_config = function()
    if ui_ok then
        dapui.close()
    end
end

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
