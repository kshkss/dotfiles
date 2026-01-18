require("nvim-treesitter").setup()
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
	callback = function(ctx)
		-- 必要に応じて`ctx.match`に入っているファイルタイプの値に応じて挙動を制御
		if ctx.match == "rust" or ctx.match == "cpp" or ctx.match == "c" then
			return
		end
		-- `pcall`でエラーを無視することでパーサーやクエリがあるか気にしなくてすむ
		pcall(vim.treesitter.start)
	end,
})
