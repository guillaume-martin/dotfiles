-- Some themes don't render correctly when using neovim in tmux
-- https://libreddit.kavin.rocks/r/neovim/comments/11a62hj/color_schemes_seem_to_be_highlighting_incorrectly/


vim.o.termguicolors = true
vim.cmd.colorscheme("gruvbox")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


