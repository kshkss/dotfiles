return require("lazy").setup({
	-- ウィンドウサイズを調整するツール
	'simeji/winresizer',

	-- コピー箇所をハイライト
	'machakann/vim-highlightedyank',

	-- 検索結果の総数と現在位置を表示する
	--use 'osyo-manga/vim-anzu'

	-- カラースキーム
	{
		'joshdick/onedark.vim',
		config = function()
			vim.cmd "colorscheme onedark"
		end,
	},

	-- ステータスライン
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require("config/lualine")
		end,
	},

	-- 開いているバッファをタブで表示
	{
		'akinsho/bufferline.nvim',
		tag = "v3.*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require("bufferline").setup {}
		end,
		enabled = false,
	},

	-- ハイライトとインデント
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require("config/nvim-treesitter")
		end,
	},

	-- LSPの設定ツール
	{
		'neovim/nvim-lspconfig',
		config = function()
			require("config/lspconfig")
		end,
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'ray-x/lsp_signature.nvim',
		},
	},

	-- 補完ツール
	{
		'hrsh7th/nvim-cmp',
		config = function()
			require("config/nvim-cmp")
		end,
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'dcampos/cmp-snippy',
		},
	},

	-- スニペットツール
	{
		'dcampos/nvim-snippy', 
		dependencies = {
			'dcampos/cmp-snippy',
		},
		config = function()
			require("config/nvim-snippy")
		end,
	},

	-- ファジィファインダ兼LSP表示用
	{
		'ibhagwan/fzf-lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require("config/fzf-lua")
		end,
	},

	-- インデントラインを表示
	{
		"lukas-reineke/indent-blankline.nvim",
		ft = { "python", },
		config = function()
			require("config/indent-blankline")
		end,
	},

	-- gitgutterみたいに変更箇所を横に表示する
	"lewis6991/gitsigns.nvim",

	-- vim-fugitiveみたいにgit diffを見やすくしてくれるやつ
	{
		"sindrets/diffview.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			'nvim-tree/nvim-web-devicons',
		},
		enabled = false,
	},
})
