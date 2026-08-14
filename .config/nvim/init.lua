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
vim.opt.splitright = true

function load_sops_secrets()
	local secrets_file = vim.fn.stdpath('config') .. '/secrets.sops.json'

	if vim.fn.filereadable(secrets_file) == 0 then
		vim.notify("secrets.sops.json is not found: 暗号化された環境変数の読み込めませんでした。", vim.log.levels.ERROR)
	elseif vim.env.BW_SESSION == nil or vim.env.BW_SESSION == "" then
		vim.notify("BW_SESSION を設定してください。暗号化された環境変数の読み込めませんでした。", vim.log.levels.ERROR)
	else
		-- sopsコマンドでオンメモリ復号
		local key_cmd = string.format(
			"/usr/bin/bw get item 'SOPS Key' --session '%s' | /usr/bin/jq -r '.sshKey.privateKey'",
			vim.env.BW_SESSION)
		--vim.env.SOPS_AGE_SSH_PRIVATE_KEY_CMD = key_cmd
		--vim.env.SOPS_AGE_SSH_PRIVATE_KEY_CMD = string.format('sh -c "%s"', key_cmd)
		local result = vim.fn.system({ 'sops', '-d', secrets_file })

		if vim.v.shell_error == 0 then
			-- 復号したJSON文字列をLuaのテーブルに変換
			local success, secrets = pcall(vim.json.decode, result)

			if success and type(secrets) == "table" then
				-- 取得したテーブルのキーと値をループ処理
				for key, value in pairs(secrets) do
					-- すべてのキーを大文字に変換して環境変数にセット
					vim.env[string.upper(key)] = tostring(value)
				end
			else
				vim.notify("秘密鍵ファイルのJSONパースに失敗しました", vim.log.levels.ERROR)
			end
		else
			vim.notify("secrets.sops.json の復号に失敗しました\n" .. result, vim.log.levels.ERROR)
		end
	end
end
