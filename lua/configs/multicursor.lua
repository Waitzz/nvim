local is_ok, multicursor = pcall(require, "multicursor-nvim")
if not is_ok then
    return
end

multicursor.setup()

local cursor_stack = {}

local function lineCursor(dir)
    if #cursor_stack > 0 and cursor_stack[#cursor_stack] == -dir then
        multicursor.lineSkipCursor(dir)
        table.remove(cursor_stack)
    else
        multicursor.lineAddCursor(dir)
        table.insert(cursor_stack, dir)
    end
end

vim.keymap.set({ "n", "i", "x" }, "<C-Up>", function()
    lineCursor(-1)
end)
vim.keymap.set({ "n", "i", "x" }, "<C-Down>", function()
    lineCursor(1)
end)

vim.keymap.set({ "n", "x" }, "<C-q>", multicursor.toggleCursor)

multicursor.addKeymapLayer(function(keymap)
    keymap({ "n" }, "<ESC>", function()
        if not multicursor.cursorsEnabled() then
            multicursor.enableCursors()
        else
            multicursor.clearCursors()
            cursor_stack = {}
        end
    end)
end)
