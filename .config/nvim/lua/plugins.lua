vim.cmd.packadd "packer.nvim"

return require("packer").startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- utilities
	use "nvim-lua/plenary.nvim"

	-- ウィンドウサイズを調整するツール
	use 'simeji/winresizer'

	-- コピー箇所をハイライト
	use 'machakann/vim-highlightedyank'

	-- 検索結果の総数と現在位置を表示する
	--use 'osyo-manga/vim-anzu'

	-- カラースキーム
	use {
		'joshdick/onedark.vim',
		config = function()
			vim.cmd "colorscheme onedark"
		end,
	}

	-- ステータスライン
	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			{ 'nvim-tree/nvim-web-devicons', },
		},
		confid = function()
			require("config/lualine")
		end,
	}

--	-- 開いているバッファをタブに表示
--	use {
--		'akinsho/bufferline.nvim',
--		tag = "v3.*",
--		requires = 'nvim-tree/nvim-web-devicons',
--		config = function()
--			require("bufferline").setup {}
--		end,
--	}

	-- ハイライトとインデント
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require("config/nvim-treesitter")
		end,
	}

	-- LSPの設定ツール
	use {
		'neovim/nvim-lspconfig',
		config = function()
			require("config/lspconfig")
		end,
		requires = {
			{ 'hrsh7th/cmp-nvim-lsp', },
			{ 'ray-x/lsp_signature.nvim', },
		},
	}

	-- 補完ツール
	use {
		'hrsh7th/nvim-cmp',
		config = function()
			require("config/nvim-cmp")
		end,
		requires = {
			{ 'hrsh7th/cmp-nvim-lsp', },
			{ 'hrsh7th/cmp-buffer', },
			{ 'hrsh7th/cmp-path', },
			{ 'hrsh7th/cmp-cmdline', },
			{ 'dcampos/cmp-snippy', },
		},
	}

	-- スニペットツール
	use {
		'dcampos/nvim-snippy', 
		requires = {
			{ 'dcampos/cmp-snippy', },
		},
	}

	-- ファジィファインダ兼LSP表示用
	use {
		'ibhagwan/fzf-lua',
		requires = {
			{ 'nvim-tree/nvim-web-devicons', },
		},
		config = function()
			require("config/fzf-lua")
		end,
	}

	-- インデントラインを表示
	use {
		"lukas-reineke/indent-blankline.nvim",
		ft = { "python", },
		config = function()
			require("config/indent-blankline")
		end,
	}
end)
