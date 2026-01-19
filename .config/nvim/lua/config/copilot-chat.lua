-- Auto-command to customize chat buffer behavior
vim.api.nvim_create_autocmd('BufEnter', {
	pattern = 'copilot-*',
	callback = function()
		vim.opt_local.relativenumber = false
		vim.opt_local.number = false
		vim.opt_local.conceallevel = 0
	end,
})

-- In your colorscheme or init.lua
vim.api.nvim_set_hl(0, 'CopilotChatHeader', { fg = '#7C3AED', bold = true })
vim.api.nvim_set_hl(0, 'CopilotChatSeparator', { fg = '#374151' })

vim.keymap.set("n", "<leader>aa", "<cmd>CopilotChat<CR>", { desc = "Open CopilotChat" })
vim.keymap.set("n", "<leader><C-l>", "<cmd>CopilotChatReset<CR>", { desc = "Reset CopilotChat" })
