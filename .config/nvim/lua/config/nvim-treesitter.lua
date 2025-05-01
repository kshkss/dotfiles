require("nvim-treesitter.configs").setup({
	ensure_install = "maintained",
	highlight = {
		enable = true,
		disable = {
			"rust",
			"cpp",
		},
	},
	indent = {
		enable = true,
		disable = {
			"rust",
			"cpp",
		},
	},
})
