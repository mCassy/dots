return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local function send_current_buffer_to_qflist()
			local current_bufnr = vim.api.nvim_get_current_buf()
			actions.send_to_qflist({ prompt_bufnr = current_bufnr })
		end
		telescope.setup({
			extensions = {
				file_browser = {
					hidden = { file_browser = true, folder_browser = true },
					prompt_path = true,
				},
			},
			-- pickers = {
			-- 	find_files = {
			-- 		-- no_ignore = true,
			-- 		hidden = true,
			-- 	},
			-- },
			defaults = {
				layout_config = {
					horizontal = {
						preview_cutoff = 0,
					},
					prompt_position = "bottom",
				},
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
					n = {
						["<C-q>"] = send_current_buffer_to_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		local keymap = vim.keymap

		keymap.set(
			"n",
			"<leader><leader>",
			"<cmd>Telescope find_files hidden=true<cr>",
			{ desc = "Fuzzy find files in cwd" }
		)
		keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>sc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>sq", "<cmd>Telescope quickfix<cr>", { desc = "Quickfix List" })
		keymap.set(
			"n",
			"<leader>sb",
			"<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
			{ desc = "Buffers" }
		)
		keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Key Maps" })
	end,
}
