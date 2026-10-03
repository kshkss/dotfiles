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
		branch = "main",
		build = ':TSUpdate',
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
					enabled = false },
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

	-- utilities
	"nvim-lua/plenary.nvim",

	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function(plugin, opts)
			load_sops_secrets()
			require("codecompanion").setup(opts)
		end,
		keys = {
			-- leader aa でチャットのトグル
			{ "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", mode = "n", desc = "CodeCompanion Chat" },
		},
		opts = {
			prompt_library = {
				["Custom Commit Message"] = {
					interaction = "chat",
					description = "Generate a commit message with commitizen convention",
					opts = {
						alias = "commit-cz",
						is_slash_cmd = true,
						auto_submit = true,
					},
					prompts = {
						{
							role = "user",
							content = function()
								return string.format(
									[[Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.

```diff
%s
```]],
									vim.fn.system("git diff --no-ext-diff --staged")
								)
							end,
							opts = {
								contains_code = true,
							},
						},
					},
				},
			},
			strategies = {
				chat = {
					adapter = "codex", -- openai, gemini, anthropic, ollama 等を指定
					roles = {
						user = '👤 You',
						llm = '🤖 Codex',
					},
					keymaps = {
						send = {
							modes = {
								n = "<CR>", -- ノーマルモードのEnterで送信
								i = "<C-s>", -- インサート(edit)モードのCtrl-Sで送信
							},
						},
						close = {
							modes = {
								n = "<C-c>", -- ノーマルモードのCtrl-Cで閉じる
							},
						},
					},
				},
				inline = { adapter = "copilot", model = "auto" },
				agent = { adapter = "anthropic" },
			},
			adapters = {
				acp = {
					codex = function()
						return require("codecompanion.adapters").extend("codex", {
							defaults = {
								auth_method = "chat-gpt",
							},
						})
					end,
				},
			},
		}
	},
	{
		{
			"CopilotC-Nvim/CopilotChat.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			build = "make tiktoken",
			opts = function()
				require("config/copilot-chat")
				return {
					model = 'auto', -- AI model to use
					temperature = 0.1, -- Lower = focused, higher = creative
					window = {
						layout = 'vertical', -- 'vertical', 'horizontal', 'float'
						width = 0.5, -- 80% of screen width
						--height = 0.8, -- 80% of screen height
					},
					-- auto_insert_mode = true, -- Enter insert mode when opening
					headers = {
						user = '👤 You',
						assistant = '🤖 Copilot',
						tool = '🔧 Tool',
					},
					mappings = {
						reset = {
							normal = false,
						}
					},
				}
			end,
		},
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
