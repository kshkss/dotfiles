local Mcc = require("lualine.component"):extend()

Mcc.active_requests = {} -- リクエストIDを追跡するテーブル
Mcc.spinner_index = 1

local spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
local spinner_symbols_len = #spinner_symbols

function Mcc:init(options)
	Mcc.super.init(self, options)

	local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})

	vim.api.nvim_create_autocmd({ "User" }, {
		pattern = "CodeCompanionRequest*",
		group = group,
		callback = function(request)
			if request.match == "CodeCompanionRequestStarted" then
				if request.data and request.data.id then
					-- リクエストIDを保存
					self.active_requests[request.data.id] = true
				end
			elseif request.match == "CodeCompanionRequestFinished" then
				if request.data and request.data.id then
					-- 完了したリクエストをリストから削除
					self.active_requests[request.data.id] = nil
				end
			end
		end,
	})
end

function Mcc:update_status()
	-- アクティブなリクエストがあればスピナーを回す
	local has_active_requests = false
	for _, _ in pairs(self.active_requests) do
		has_active_requests = true
		break
	end

	if has_active_requests then
		self.spinner_index = (self.spinner_index % spinner_symbols_len) + 1
		return spinner_symbols[self.spinner_index]
	else
		return nil
	end
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "onedark",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename", Mcc },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
