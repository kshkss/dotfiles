vim.opt.winblend = 10
vim.opt.termguicolors = true

-- ESC*2 でハイライトやめる
vim.keymap.set("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

require "plugins"

vim.cmd "filetype plugin indent on"
vim.cmd "syntax enable"
