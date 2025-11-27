-- leader key
vim.g.mapleader = ","

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable trust color
vim.opt.termguicolors = true

-- common settings
vim.opt.number = true
vim.opt.laststatus = 3
vim.opt.cursorline = true
vim.opt.virtualedit = "block,onemore"
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = "tab:» ,trail:·,space:·"

-- tab settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- disable mouse
vim.opt.mouse = ""

-- split settings
vim.opt.splitbelow = true
vim.opt.splitright = true

-- search settings
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cache settings
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.confirm = true

-- always show the signcolumn
vim.opt.signcolumn = "yes"

-- fold settings
local function nvim_buf_max_fold(buffer)
    local max = 0
    for i = 1, vim.api.nvim_buf_line_count(buffer) do
        if vim.fn.foldlevel(i) > max then
            max = vim.fn.foldlevel(i)
        end
    end
    return max
end

local function zm_mapping()
    local max = nvim_buf_max_fold(0)
    if vim.wo.foldlevel > max then
        vim.wo.foldlevel = max
    end
    vim.cmd("normal! zm")
end

local function zr_mapping()
    local max = nvim_buf_max_fold(0)
    if vim.wo.foldlevel > max then
        vim.wo.foldlevel = max
    end
    vim.cmd("normal! zr")
end

function FoldText()
    local line = vim.fn.getline(vim.v.foldstart)
    return line  .. " 󰁂 " .. (vim.v.foldend - vim.v.foldstart + 1)
end

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.FoldText()"
vim.opt.fillchars = { fold = " " }
vim.opt.foldlevelstart = 99

vim.keymap.set("n", "zm", zm_mapping, { noremap = true, silent = true})
vim.keymap.set("n", "zr", zr_mapping, { noremap = true, silent = true})
