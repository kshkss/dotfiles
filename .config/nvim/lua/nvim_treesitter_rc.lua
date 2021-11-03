require'nvim-treesitter.configs'.setup {
	ensure_install = "maintained",
	highlight = {
		enable = true,
		disable = {
		 'rust',
		},
	},
	indent = {
		enable = true,
		disable = {
		 'rust',
		},
	},
}
