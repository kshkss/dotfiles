local nvim_lsp = require("lspconfig")

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<space>le", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
--vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
--vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
--vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

local on_attach = function(client, bufnr)
	require("lsp_signature").on_attach()
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	--buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	--buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "<Space>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	--buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	--buf_set_keymap("n", "<Space>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	--buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	--buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	--buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	--buf_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<Space>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	--buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	--buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	--buf_set_keymap('n', '<Space>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
	buf_set_keymap("n", "<Space>lf", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = { "clangd", "rust_analyzer", "pylsp", "lua_ls", "fortls", "elmls"}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			python = {
				checkOnType = true,
				diagnostics = true,
				inlayHints = true,
				smartCompletion = true
			},
			Lua = {
			-- depend on sumneko/lua-language-server and stylua for formatter
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	}
end

