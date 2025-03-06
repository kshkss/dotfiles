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
		--tag = "v3.*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require("bufferline").setup {}
			vim.keymap.set("n", "<TAb>", "<Cmd>BufferLineCycleNext<CR>")
			vim.keymap.set("n", "<S-TAb>", "<Cmd>BufferLineCyclePrev<CR>")
		end,
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
			'zbirenbaum/copilot-cmp',
			"onsails/lspkind.nvim",
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

	-- Github Copilot
	{
		'zbirenbaum/copilot.lua',
		config = function()
			require("copilot").setup {
				suggestion = { enabled = false },
				panel = {
				 enabled = false},
			 }
		end
	},
	{
		'zbirenbaum/copilot-cmp',
		dependencies = {
			'zbirenbaum/copilot.lua',
		},
		config = function()
			require("copilot_cmp").setup()
		end
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		--lazy = false,
		--version = false,
		tag = "v0.0.21",
		opts = {
			provider = "copilot",
			auto_suggestions_provider = "copilot",
			copilot = {
				endpoint = "https://api.githubcopilot.com",
				model = "claude-3.7-sonnet", -- ここでClaudeモデルを指定
				timeout = 30000,
				temperature = 0,
				max_tokens = 4096,
			},

			-- 動作設定
			behaviour = {
				auto_suggestions = false,
				auto_set_highlight_group = true,
				auto_set_keymaps = true,
				auto_apply_diff_after_generation = false,
				support_paste_from_clipboard = false,
				minimize_diff = true,
			},

			-- ウィンドウ設定
			windows = {
				position = "right",  -- サイドバーの位置
				wrap = true,        -- テキストの折り返し
				width = 30,         -- サイドバーの幅
				-- その他の詳細設定は省略
			},
		},
		build = "make",
		-- 依存関係の設定
		dependencies = {
			-- 必須の依存関係
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			-- オプションの依存関係
			"hrsh7th/nvim-cmp",
			"nvim-tree/nvim-web-devicons",
			"zbirenbaum/copilot.lua",
			-- その他の拡張機能
		}
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
