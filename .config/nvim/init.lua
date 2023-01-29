vim.opt.winblend = 10
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = {"plugins.lua"},
	command = "PackerCompile",
})

require "plugins"
