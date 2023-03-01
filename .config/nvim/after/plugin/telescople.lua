local builtin = require('telescope.builtin')

-- Search all files by title
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- Search files in a Git repo
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Search files containing a certain string
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
