-- Lines numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.showtabline = 2
vim.opt.copyindent = true

-- Word wrapping
vim.opt.wrap = false

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = {"*.md"},
    group = group,
    command = "setlocal wrap"
})

-- Backup files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- 80 chars margin
vim.opt.colorcolumn = "80"

-- open splits on right or bottom
vim.opt.splitright = true
vim.opt.splitbelow = true

-- highligh cursor line 
vim.opt.cursorline = true

