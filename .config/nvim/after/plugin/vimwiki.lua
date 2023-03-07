

vim.g.vimwiki_list = {{ path = "~/Documents/01-PROJECTS", syntax = "markdown", ext = ".md"}}
vim.g.vimwiki_ext2syntax = { [".md"] = "markdown" }

-- Treat all markdown files as part of wiki
vim.g.vimwiki_global_ext = 0

-- Make vimwiki links as [text](link)
vim.g.vimwiki_markdown_link_ext = 1

-- Don't conceal the cursor line 
vim.g.indentLine_setConceal = 0

