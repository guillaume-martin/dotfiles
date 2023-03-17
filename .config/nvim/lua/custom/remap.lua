
vim.g.mapleader = " " 

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Split window
vim.keymap.set("n", "<leader>|", vim.cmd.vsp)
vim.keymap.set("n", "<leader>-", vim.cmd.sp)

-- Move between panes
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")

-- Stay centered
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
