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

dap.adapters.bashdb = {
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
    name = "bashdb",
}

dap.configurations.sh = {
    {
        type = "bashdb",
        request = "launch",
        name = "Launch file",
        showDebugOutput = true,
        pathBashdb = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
        pathBashdbLib = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
        trace = true,
        file = "${file}",
        program = "${file}",
        cwd = "${workspaceFolder}",
        pathCat = "cat",
        pathBash = "bash",
        pathMkfifo = "mkfifo",
        pathPkill = "pkill",
        args = {},
        argsString = "",
        env = {},
        terminalKind = "integrated",
    },
}

dap.adapters.gdb = {
    type = "executable",
    command = "gdb-multiarch",
    args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

dap.configurations.c = {
    {
        name = "Attach to gdbserver",
        type = "gdb",
        request = "attach",
        target = function()
            return vim.fn.input("Remote Target (IP:Port): ", "")
        end,
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
    },
}

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
