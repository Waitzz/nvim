local is_ok, multicursor = pcall(require, "multicursor-nvim")
if not is_ok then
    return
end

multicursor.setup()

vim.keymap.set({ "n", "i", "x" }, "<C-Up>", function () multicursor.lineAddCursor(-1) end)
vim.keymap.set({ "n", "i", "x" }, "<C-Down>", function () multicursor.lineAddCursor(1) end)

vim.keymap.set({ "n", "x" }, "<C-q>", multicursor.toggleCursor)

multicursor.addKeymapLayer(function (keymap)
    keymap({ "n" }, "<ESC>", function ()
        if not multicursor.cursorsEnabled() then
            multicursor.enableCursors()
        else
            multicursor.clearCursors()
        end
    end)
end)
